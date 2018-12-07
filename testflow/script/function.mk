#!make
include .env powter-server.mk

.PHONY: test_install test_uninstall test_installafteruninstall test_reinstall test_reuninstall 
ifeq ($(TESTMODE),dev)
install uninstall: 
	make  test_install
	make  test_uninstall
installafteruninstall: 
	make  test_install
	make  test_uninstall
	make  test_install
	make  test_uninstall
reinstall: 
	make  test_install
	make  test_install
	make  test_uninstall
reuninstall: 
	make  test_install
	make  test_uninstall
	make  test_uninstall
else ifeq ($(TESTMODE),prod)
install: 
	make  test_install
	make -f powter-server.mk netflow 
	make  test_uninstall
uninstall:  
	make  test_install
	make  test_uninstall
	make -f powter-server.mk netflow 
installafteruninstall: 
	make  test_install
	make  test_uninstall
	make  test_install
	make -f powter-server.mk netflow 
	make  test_uninstall
reinstall:  
	make  test_install
	make  test_install
	make -f powter-server.mk netflow 
	make  test_uninstall
reuninstall: 
	make  test_install
	make  test_uninstall
	make  test_uninstall
	make -f powter-server.mk netflow 
else
install uninstall installafteruninstall reinstall reuninstall: 
	make -s -f main.mk hint CONTENT="Please set test mode to either dev or prod!"
endif


.PHONY: test_reboot_p1 
ifeq ($(TESTMODE), $(filter $(TESTMODE),dev prod))
reboot_p1: 
	make  test_install
	make  re_boot
else
reboot_p1 : 
	make -s -f main.mk hint CONTENT="Please set test mode to either dev or prod!"
endif



.PHONY: test_reboot_p2 test_restartall 
ifeq ($(TESTMODE),dev)
reboot_p2: 
	make test_status
	make test_uninstall
restartall:
	make test_install
	make test_restart
	make test_status
	make test_uninstall
else ifeq ($(TESTMODE),prod)
reboot_p2: 
	make test_status
	make -f powter-server.mk netflow
	make test_uninstall
restartall:
	make test_install
	make test_restart
	make test_status
	make-f powter-server.mk netflow
	make test_uninstall
else
reboot_p2 restartall : 
	make -s -f main.mk hint CONTENT="Please set test mode to either dev or prod!"
endif

	
.PHONY: updateconf_dns updateconf_sskcp
ifeq ($(TESTMODE),dev)
updateconf: 
	make test_install
	make test_update
	make test_uninstall
else ifeq ($(TESTMODE),prod)
updateconf: 
	make test_install
	make test_update
	make test_showconf
	make -f powter-server.mk netflow
	make test_uninstall
else
updateconf:
	make -s -f main.mk hint CONTENT="Please set test mode to either dev or prod!"
endif




