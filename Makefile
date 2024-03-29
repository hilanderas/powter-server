version=0.3.1
project=powter-server
GITBOOK=$(CURDIR)/gitbook
DOCS=$(CURDIR)/docs
TESTFLOW=$(project)-testflow
CUR=0.3.1

.PHONY: build-book
build-book: $(GITBOOK)
	gitbook build $(GITBOOK) $(DOCS)

.PHONY: build
build:
	cp -r ctl ${project}
	cd ${project}/; find . -type f -exec md5sum {} \; > ${CURDIR}/${project}-${version}.md5; cd -
	mv ${project}-${version}.md5 ${project}
	zip -r ${project}-${version}.zip ${project}
	rm -rf ${project}

build-testflow:
	cp -r testflow/script $(TESTFLOW)
	cp -r testflow/info.yml $(TESTFLOW)
	cd $(TESTFLOW) && make -f basic.mk set_mod TESTMODE=prod
	sed -i '/PROJ_VERSION/c\export PROJ_VERSION=${version}' $(TESTFLOW)/.env 
	cd $(TESTFLOW)/; find . -type f -exec md5sum {} \; > $(CURDIR)/$(TESTFLOW)-$(version).md5; cd -
	mv $(TESTFLOW)-$(version).md5 $(TESTFLOW)
	zip -r $(TESTFLOW)-$(version).zip $(TESTFLOW)
	rm -rf $(TESTFLOW)

update-gitbook: $(GITBOOK) check_parameter
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/testflow/PRODUCTIONMODE.md
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/SUMMARY.md
	sed -i s/[0-9][.][0-9][.][0-9]/$(CUR)/g $(CURDIR)/gitbook/en/quickstart/INSTALL.md
	grep -R $(CUR) gitbook

build-doc: update-gitbook build-book

check_parameter:
	echo "Usage: update-gitbook CUR=$(CUR)"
	test $(CUR)

