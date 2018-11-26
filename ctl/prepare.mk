CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

## download dns
.PHONY: dl-dns-api dl-dns-confgen dl-dns-image download-dns
dl-dns-api:
	./dlzip.sh $(DNS_API_ZIP) $(SRC_DIR) $(DNS_API_URL) $(DNS_API)

dl-dns-confgen:
	./dlzip.sh $(DNS_CONFGEN_ZIP) $(SRC_DIR) $(DNS_CONFGEN_URL) $(DNS_CONFGEN)

dl-dns-image:
	docker pull $(DNS_IMAGE)
	docker images | grep dns-proxy

download-dns: dl-dns-api dl-dns-confgen dl-dns-image

## download sskcp
.PHONY: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image download-sskcp
dl-sskcp-api:
	./dlzip.sh $(SSKCP_API_ZIP) $(SRC_DIR) $(SSKCP_API_URL) $(SSKCP_API)

dl-sskcp-confgen:
	./dlzip.sh $(SSKCP_CONFGEN_ZIP) $(SRC_DIR) $(SSKCP_CONFGEN_URL) $(SSKCP_CONFGEN) 

dl-sskcp-image:
	docker pull $(SSKCP_IMAGE)
	docker images | grep sskcp

download-sskcp: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image


.PHONY: download-apis download-confgens download-images
# Download the project
download-apis: dl-dns-api dl-sskcp-api
download-images: dl-dns-image dl-sskcp-image
download-confgens: dl-dns-confgen dl-sskcp-confgen

.PHONY: geninfo reset-info
geninfo:
	./confmgr.py mergeinfo --dns $(DNS_CONFGEN)/dns-proxy-info.yml --sskcp $(SSKCP_CONFGEN)/sskcp-server-info.yml --info $(POWTER_SERVER_INFO) 


resetinfo: geninfo

.PHONY: create-server
create-server:
ifeq (, $(wildcard $(SRC_DIR)))
	mkdir $(SRC_DIR)
endif

.PHONY: prepare
prepare: create-server download-apis download-confgens download-images geninfo

