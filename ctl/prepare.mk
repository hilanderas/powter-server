CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

## download dns
.PHONY: dl-dns-api dl-dns-confgen dl-dns-image download-dns
dl-dns-api:
	cd $(SRC_DIR) && wget $(DNS_API_URL) && unzip $(DNS_API_ZIP) 

dl-dns-confgen:
	cd $(SRC_DIR) && wget $(DNS_CONFGEN_URL) && unzip $(DNS_CONFGEN_ZIP) 

dl-dns-image:
	docker pull $(DNS_IMAGE)
	docker images | grep dns-proxy

download-dns: dl-dns-api dl-dns-confgen dl-dns-image

## download sskcp
.PHONY: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image download-sskcp
dl-sskcp-api:
	cd $(SRC_DIR) && wget $(SSKCP_API_URL) && unzip $(SSKCP_API_ZIP)

dl-sskcp-confgen:
	cd $(SRC_DIR) && wget $(SSKCP_CONFGEN_URL) && unzip $(SSKCP_CONFGEN_ZIP)

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
	mkdir server
.PHONY: prepare
prepare: create-server download-apis download-confgens download-images geninfo

