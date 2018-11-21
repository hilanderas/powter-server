#!make
include .env
LIB=".env"
VERSION=0.1.1
PROJECT=powter-server

.PHONY: download rm_download
download:
	wget https://github.com/hilanderas/${PROJECT}/releases/download/${VERSION}/${PROJECT}-${VERSION}.zip
	unzip ${PROJECT}-${VERSION}.zip

rm_download:
	rm -rf ${PROJECT}*


.PHONY: config read_config init_config 
config: 
	sed -i '/PROJ/c\export PROJ=${PROJ}' ${LIB}
	sed -i '/IFACE/c\export IFACE=${IFACE}' ${LIB}

read_config:
	cat ${LIB} | grep "PROJ"
	cat ${LIB} | grep "IFACE"

init_config: 
	sed -i '/PROJ/c\export PROJ=${PROJ}' ${LIB}
	sed -i '/IFACE/c\export IFACE=enp0s25' ${LIB}

.PHONY: reset_env
reset_env:
	sed -i '/PROJ/c\export PROJ=' ${LIB}
	sed -i '/IFACE/c\export IFACE=' ${LIB}
	sed -i '/TESTMODE/c\export TESTMODE=' ${LIB}
	cat ${LIB}

.PHONY: set_mod read_mod 
set_mod:
	sed -i '/TESTMODE/c\export TESTMODE=${TESTMODE}' ${LIB}
read_mod:
	printenv TESTMODE

.PHONY: test_prepare test_remove config startup cleanup
test_prepare:
	./prepare.sh

test_remove:
	./remove.sh

test_config: 
	./config.sh

startup startup_again:
	./config.sh
	./start.sh

cleanup cleanup_again:
	./stop.sh
	./restore.sh

.PHONY: status status_dns status_sskcp functionality showconf
status:	
	./status.sh

status_dns:
	./status.sh dns

status_sskcp:
	./status.sh sskcp

functionality:
	./hint.sh
	./netflow.sh

showconf:
	./showconf.sh

.PHONY: reboot restart restart_dns restart_sskcp
reboot:
	./reboot.sh

restart:
	./restart.sh

restart_dns:
	./restart.sh dns

restart_sskcp:
	./restart.sh sskcp


.PHONY: test_install test_uninstall test_installafteruninstall test_reinstall test_reuninstall test_after_reboot test_restartall test_updateconf_dns test_updateconf_sskcp
ifeq ($(TESTMODE),dev)
test_install: startup status cleanup
test_uninstall: startup cleanup
test_installafteruninstall: startup cleanup startup_again status cleanup_again
test_reinstall: startup startup_again status cleanup
test_reuninstall: startup cleanup cleanup_again
test_after_reboot: status cleanup
test_restartall:startup restart status cleanup
test_updateconf_dns: startup test_config restart_dns status_dns cleanup
test_updateconf_sskcp: startup test_config restart_sskcp status_sskcp cleanup
else ifeq ($(TESTMODE), prod)
test_install: startup status functionality cleanup 
test_uninstall: startup cleanup functionality 
test_installafteruninstall: startup cleanup startup_again status functionality cleanup_again
test_reinstall: startup startup_again status functionality cleanup
test_reuninstall: startup cleanup cleanup_again functionality 
test_after_reboot: status functionality cleanup
test_restartall:startup restart status functionality cleanup
test_updateconf_dns: startup test_config restart_dns status_dns functionality cleanup
test_updateconf_sskcp: startup test_config restart_sskcp status_sskcp functionality cleanup
else
test_install test_uninstall test_installafteruninstall test_reinstall test_reuninstall test_after_reboot test_restartall test_updateconf_dns test_updateconf_sskcp: 
	echo "Please set test mode correctly!"
endif

.PHONY: test_checkconfig test_before_reboot
test_checkconfig: startup status showconf cleanup	
test_before_reboot: startup reboot

