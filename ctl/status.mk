CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: status status-dns status-sskcp

status: status-dns status-sskcp

status-dns: $(POWTER_SERVER_CONF)/dnsconf $(DNS_API)
	make -C $(DNS_API) status NAME=$(PROJ)-dns || true

composes = $(shell ls $(SSKCP_API)/compose)
status-sskcp: $(POWTER_SERVER_CONF)/sskcpconf $(SSKCP_API)
	$(foreach c, $(composes), make -C $(SSKCP_API) status NAME=$(basename $(c));)	

.PHONY: showconf
showconf: showconf-dns showconf-sskcp
showconf-dns: $(POWTER_SERVER_CONF)/dnsconf
	cat $(POWTER_SERVER_CONF)/dnsconf/dns-server.conf

confs = $(shell ls $(POWTER_SERVER_CONF)/sskcpconf)
showconf-sskcp: $(POWTER_SERVER_CONF)/sskcpconf
	$(foreach c, $(confs), echo $(POWTER_SERVER_CONF)/sskcpconf/$(c) && cat $(POWTER_SERVER_CONF)/sskcpconf/$(c)/conf/* && echo "\n" && cat $(POWTER_SERVER_CONF)/sskcpconf/$(c)/config.env && echo "\n";)	




