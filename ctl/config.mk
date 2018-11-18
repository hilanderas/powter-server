CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: config edit genconf mkconf cleanconf rmconf
edit: $(POWTER_SERVER_INFO)
	# if INFO exists, vim INFO, after save, copy INFO to POWTER_SERVER_INFO
	# else vim POWTER_SERVER_INFO
ifdef INFO
	vim $(INFO)
	cp $(INFO) $(POWTER_SERVER_INFO)
else
	vim $(POWTER_SERVER_INFO)
endif

mkconf: $(POWTER_SERVER_INFO)
	rm -rf $(POWTER_SERVER_CONF) || true
	mkdir $(POWTER_SERVER_CONF)

rmconf: $(POWTER_SERVER_CONF)
	rm -rf $(POWTER_SERVER_CONF)

genconf: $(POWTER_SERVER_INFO) mkconf cleanconf
	./confmgr.py divideinfo --info $(POWTER_SERVER_INFO) --dns $(DNS_INFO) --sskcp $(SSKCP_INFO)
	mkdir $(POWTER_SERVER_CONF)/dnsconf
	cd $(DNS_CONFGEN) && python3 -m confgenerator.cli -f $(DNS_INFO) -d $(POWTER_SERVER_CONF)/dnsconf
	cd $(SSKCP_CONFGEN) && python3 -m confgenerator.cli server -f $(SSKCP_INFO) -d $(POWTER_SERVER_CONF)/sskcpconf


config: $(POWTER_SERVER_INFO) edit genconf 

cleanconf:
	rm -rf $(POWTER_SERVER_CONF)/*
