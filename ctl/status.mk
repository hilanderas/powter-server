CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: status status-dns status-sskcp

status: status-sskcp status-dns

status-dns: $(POWTER_SERVER_CONF)/dnsconf $(DNS_API)
	make -C $(DNS_API) status NAME=$(PROJ)-dns || true

composes = $(shell ls $(SSKCP_API)/compose)
status-sskcp: $(POWTER_SERVER_CONF)/sskcpconf $(SSKCP_API)
	$(foreach c, $(composes), make -C $(SSKCP_API) status NAME=$(basename $(c));)	

.PHONY: showconf
showconf: showconf-dns showconf-sskcp
showconf-dns: $(POWTER_SERVER_CONF)/dnsconf
	cat $(POWTER_SERVER_CONF)/dnsconf/config.env

confs = $(shell ls $(POWTER_SERVER_CONF)/sskcpconf)
showconf-sskcp: $(POWTER_SERVER_CONF)/sskcpconf
	$(foreach c, $(confs), echo $(POWTER_SERVER_CONF)/sskcpconf/$(c) && cat $(POWTER_SERVER_CONF)/sskcpconf/$(c)/conf/* && echo "\n" && cat $(POWTER_SERVER_CONF)/sskcpconf/$(c)/config.env && echo "\n";)	

.PHONY: showinfo show-ququed-info
showinfo: $(POWTER_SERVER_INFO)
	cat $(POWTER_SERVER_INFO)

show-queued-info: $(QUEUED_INFO)
	cat $(QUEUED_INFO)

.PHONY: show-queued-conf show-queued-conf-dns show-queued-conf-bypass show-queued-conf-sskcp
show-queued-conf: show-queued-conf-dns show-queued-conf-bypass show-queued-conf-sskcp

show-queued-conf-dns: $(QUEUED_CONF)/dnsconf
	cat $(QUEUED_CONF)/dnsconf/dns-server.conf
	
show-queued-conf-bypass: $(QUEUED_CONF)/bypassconf
	cat $(QUEUED_CONF)/bypassconf/config.env
	cat $(QUEUED_CONF)/bypassconf/conf/03-vps

queue-confs = $(shell ls $(QUEUED_CONF)/sskcpconf)
show-queued-conf-sskcp: $(QUEUED_CONF)/sskcpconf
	$(foreach c, $(queue-confs), echo $(QUEUED_CONF)/sskcpconf/$(c) && cat $(QUEUED_CONF)/sskcpconf/$(c)/conf/* && echo "\n" && cat $(QUEUED_CONF)/sskcpconf/$(c)/config.env && echo "\n";)	


