CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: edit gen-queued-conf gen-conf mk-queued-conf mk-conf set-conf restore-conf
edit: $(QUEUED_INFO)
ifdef INFO
	vim $(INFO)
	cp $(INFO) $(QUEUED_INFO)
else
	vim $(QUEUED_INFO)
endif

mk-queued-conf: $(QUEUED_INFO)
	rm -rf $(QUEUED_CONF) || true
	mkdir $(QUEUED_CONF)


gen-queued-conf: $(QUEUED_INFO) mk-queued-conf
	./confmgr.py validate --info $(QUEUED_INFO)
	./confmgr.py divideinfo --info $(QUEUED_INFO) --dns $(DNS_INFO) --sskcp $(SSKCP_INFO)
	mkdir $(QUEUED_CONF)/dnsconf
	cd $(DNS_CONFGEN) && python3 -m confgenerator.cli -f $(DNS_INFO) -d $(QUEUED_CONF)/dnsconf
	cd $(SSKCP_CONFGEN) && python3 -m confgenerator.cli server -f $(SSKCP_INFO) -d $(QUEUED_CONF)/sskcpconf

rm-queued-conf: $(QUEUED_CONF)
	rm -rf $(QUEUED_CONF)

gen-conf: edit gen-queued-conf 

mk-conf: $(POWTER_SERVER_INFO)
	rm -rf $(POWTER_SERVER_CONF) || true
	mkdir $(POWTER_SERVER_CONF)

set-conf: $(QUEUED_CONF) mk-conf 
	mv $(QUEUED_CONF)/* $(POWTER_SERVER_CONF)/
	rm -rf $(QUEUED_CONF)
	cp $(QUEUED_INFO) $(POWTER_SERVER_INFO)

restore-conf: $(POWTER_SERVER_CONF)
	mv $(POWTER_SERVER_CONF) $(QUEUED_CONF)
