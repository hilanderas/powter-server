CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: start start-dns start-sskcp

start: start-dns start-sskcp

start-dns: $(POWTER_SERVER_CONF)/dnsconf $(DNS_API)
	make -C $(DNS_API) config CONFIG=$(POWTER_SERVER_CONF)/dnsconf NAME=$(PROJ)-dns && make -C $(DNS_API) start NAME=$(PROJ)-dns

confs = $(shell ls $(POWTER_SERVER_CONF)/sskcpconf)
start-sskcp: $(POWTER_SERVER_CONF)/sskcpconf $(SSKCP_API)
	$(foreach c, $(confs), make -C $(SSKCP_API) config CONFIG=$(POWTER_SERVER_CONF)/sskcpconf/$(c) NAME=$(PROJ)-sskcp-$c && make -C $(SSKCP_API) start NAME=$(PROJ)-sskcp-$(c);)	




