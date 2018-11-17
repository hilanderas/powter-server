CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

.PHONY: is-dns-image-existed is-sskcp-image-existed
is-dns-image-existed: 
	((test ! -z $(shell docker images -q $(DNS_IMAGE))) && echo "$(DNS_IMAGE) exists") || (echo "$(DNS_IMAGE) does NOT exist") 

is-sskcp-image-existed: 
	((test ! -z $(shell docker images -q $(SSKCP_IMAGE))) && echo "$(SSKCP_IMAGE) does exist") || echo "$(SSKCP_IMAGE) does NOT exist"

.PHONY: is-dns-confgen-existed is-sskcp-confgen-existed
is-dns-confgen-existed:
	((test -d $(DNS_CONFGEN)) && echo "$(DNS_CONFGEN) exists") || (echo "$(DNS_CONFGEN) does NOT exist") 
	((test -e $(DNS_CONFGEN_ZIP)) && echo "$(DNS_CONFGEN_ZIP) exists") || (echo "$(DNS_CONFGEN_ZIP) does NOT exist") 

is-sskcp-confgen-existed:
	((test -d $(SSKCP_CONFGEN)) && echo "$(SSKCP_CONFGEN) exists") || (echo "$(SSKCP_CONFGEN) does NOT exist") 
	((test -e $(SSKCP_CONFGEN_ZIP)) && echo "$(SSKCP_CONFGEN_ZIP) exists") || (echo "$(SSKCP_CONFGEN_ZIP) does NOT exist") 

.PHONY: is-dns-api-existed is-sskcp-api-existed
is-dns-api-existed:
	((test -d $(DNS_API)) && echo "$(DNS_API) exists") || (echo "$(DNS_API) does NOT exist") 
	((test -e $(DNS_API_ZIP)) && echo "$(DNS_API_ZIP) exists") || (echo "$(DNS_API_ZIP) does NOT exist") 

is-sskcp-api-existed:
	((test -d $(SSKCP_API)) && echo "$(SSKCP_API) exists") || (echo "$(SSKCP_API) does NOT exist") 
	((test -e $(SSKCP_API_ZIP)) && echo "$(SSKCP_API_ZIP) exists") || (echo "$(SSKCP_API_ZIP) does NOT exist") 

.PHONY: is-info-existed is-info-valid
is-info-valid: $(POWTER_SERVER_INFO)
ifdef INFO
	./confmgr.py validate --info $(INFO)
else
	./confmgr.py validate --info $(POWTER_SERVER_INFO)
endif

is-info-existed:
	((test -e $(POWTER_SERVER_INFO)) && echo "$(POWTER_SERVER_INFO) exists") || (echo "$(POWTER_SERVER_INFO) does NOT exist") 

.PHONY: test-files test-dir
test-files: test-dns test-sskcp is-info-existed
test-server-dir: is-info-existed
	((test -d $(SRC_DIR)) && echo "$(SRC_DIR) exists") || (echo "$(SRC_DIR) does NOT exist") 

.PHONY: test-dns test-sskcp
test-dns: is-dns-image-existed is-dns-confgen-existed is-dns-api-existed
test-sskcp: is-sskcp-image-existed is-sskcp-confgen-existed is-sskcp-api-existed



.PHONY: test-config test-restore
test-config: $(POWTER_SERVER_CONF)
	tree $(POWTER_SERVER_CONF)

test-restore:
	((test -d $(POWTER_SERVER_CONF)) && echo "$(POWTER_SERVER_CONF) exists") || (echo "$(POWTER_SERVER_CONF) does NOT exist") 


