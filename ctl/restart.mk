CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: restart restart-dns restart-sskcp

restart: restart-dns restart-sskcp

restart-dns: $(POWTER_SERVER_CONF)/dnsconf $(DNS_API) 
	make -f stop.mk stop-dns
	make -f start.mk start-dns

restart-sskcp: $(POWTER_SERVER_CONF)/sskcpconf $(SSKCP_API)
	make -f stop.mk stop-sskcp
	make -f start.mk start-sskcp

