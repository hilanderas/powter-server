CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

.PHONY: is-dns-image-existed is-sskcp-image-existed
is-dns-image-existed: 
	./imageexisted.sh $(DNS_IMAGE) 

is-sskcp-image-existed: 
	./imageexisted.sh $(SSKCP_IMAGE)

.PHONY: is-dns-confgen-existed is-sskcp-confgen-existed
is-dns-confgen-existed:
	./existed.sh $(DNS_CONFGEN)
	./existed.sh $(DNS_CONFGEN_ZIP)

is-sskcp-confgen-existed:
	./existed.sh $(SSKCP_CONFGEN) 
	./existed.sh $(SSKCP_CONFGEN_ZIP) 

.PHONY: is-dns-api-existed is-sskcp-api-existed
is-dns-api-existed:
	./existed.sh $(DNS_API) 
	./existed.sh $(DNS_API_ZIP) 

is-sskcp-api-existed:
	./existed.sh $(SSKCP_API) 
	./existed.sh $(SSKCP_API_ZIP) 

.PHONY: is-info-existed is-info-valid
is-info-valid: $(POWTER_SERVER_INFO)
ifdef INFO
	./confmgr.py validate --info $(INFO)
else
	./confmgr.py validate --info $(POWTER_SERVER_INFO)
endif

is-info-existed:
	./existed.sh $(POWTER_SERVER_INFO) 

.PHONY: is-ququed-info-existed is-queued-info-valid
is-queued-info-valid: $(QUEUED_INFO)
	./confmgr.py validate --info $(QUEUED_INFO)

is-queued-info-existed:
	./existed.sh $(QUEUED_INFO)

.PHONY: is-config-existed is-queued-config-existed
is-config-existed:
	./existed.sh $(POWTER_SERVER_CONF)

is-queued-config-existed:
	./existed.sh $(QUEUED_CONF)


.PHONY: test-files test-server-dir
test-files: test-dns test-sskcp is-info-existed
test-server-dir:
	((test -d $(SRC_DIR)) && echo "$(SRC_DIR) exists") || (echo "$(SRC_DIR) does NOT exist") 

.PHONY: test-dns test-sskcp
test-dns: is-dns-image-existed is-dns-confgen-existed is-dns-api-existed
test-sskcp: is-sskcp-image-existed is-sskcp-confgen-existed is-sskcp-api-existed

.PHONY: test-config test-queued-config
test-config: is-config-existed
test-queued-config: is-queued-config-existed

.PHONY: test-info test-queued-info
test-info: is-info-existed
test-queued-info: is-queued-info-existed

.PHONY: test-services
test-services:
	docker ps -a | grep powter || true
