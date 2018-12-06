#!make
include interface.mk  powter-server.mk

.PHONY: test_install test_uninstall test_installafteruninstall test_reinstall test_reuninstall 
ifeq ($(TESTMODE),dev)
install uninstall: 
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
installafteruninstall: 
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
	make -f interface.mk test_install
reinstall: 
	make -f interface.mk test_install
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
reuninstall: 
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
	make -f interface.mk test_uninstall
else ifeq ($(TESTMODE),prod)
install: 
	make -f interface.mk test_install
	make -f powter-server.mk netflow 
	make -f interface.mk test_uninstall
uninstall:  
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
	make -f powter-server.mk netflow 
installafteruninstall: 
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
	make -f interface.mk test_install
	make -f powter-server.mk netflow 
	make -f interface.mk test_uninstall
reinstall:  
	make -f interface.mk test_install
	make -f interface.mk test_install
	make -f powter-server.mk netflow 
	make -f interface.mk test_uninstall
reuninstall: 
	make -f interface.mk test_install
	make -f interface.mk test_uninstall
	make -f interface.mk test_uninstall
	make -f powter-server.mk netflow 
else
install uninstall installafteruninstall reinstall reuninstall: 
	make -s hint CONTENT="Please set test mode to either dev or prod!"
endif


.PHONY: test_reboot_p1 
ifeq ($(TESTMODE), $(filter $(TESTMODE),dev prod))
reboot_p1: 
	make test_install
	make re_boot
else
reboot_p1 : 
	make -s hint CONTENT="Please set test mode to either dev or prod!"
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
	make netflow
	make test_uninstall
restartall:
	make test_install
	make test_restart
	make test_status
	make netflow
	make test_uninstall
else
reboot_p2 restartall : 
	make -s hint CONTENT="Please set test mode to either dev or prod!"
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
	make netflow
	make test_uninstall
else
updateconf:
	make -s hint CONTENT="Please set test mode to either dev or prod!"
endif




