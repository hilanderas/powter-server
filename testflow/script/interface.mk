#!make
include .env  Makefile 



.PHONY: test_prepare test_remove
test_prepare:
	cd ${TEST_PROJ} && make prepare
	make confirm

test_remove:
	 cd ${TEST_PROJ} && make remove



.PHONY: test_install test_uninstall test_update
test_install: 
	 cd ${TEST_PROJ} && make install

test_uninstall:
	 cd ${TEST_PROJ} && make uninstall



.PHONY: test_genconf test_setconf test_restoreconf test_rmconf
test_genconf:
	 cd ${TEST_PROJ} && make gen_config 

test_setconf:
	 cd ${TEST_PROJ} && make set_config 

test_rmconfig:
	 cd ${TEST_PROJ} && make rm_config
test_popconfig:
	 cd ${TEST_PROJ} && make pop_config




.PHONY: test_start test_stop test_restart test_restart_sskcp test_restart_dns test_restart_bypass
test_start: 
	 cd ${TEST_PROJ} && make start
test_stop:
	 cd ${TEST_PROJ} && make stop
test_restart:
	 cd ${TEST_PROJ} && make restart
test_restart_sskcp:
	 cd ${TEST_PROJ} && make restart_sskcp
test_restart_dns:
	 cd ${TEST_PROJ} && make restart_dns
test_restart_bypass:
	 cd ${TEST_PROJ} && make restart_bypass

.PHONY: test_status test_state
test_status:
	 cd ${TEST_PROJ} && make status
test_status_sskcp:
	 cd ${TEST_PROJ} && make status_sskcp
test_status_dns:
	 cd ${TEST_PROJ} && make status_dns
test_status_bypass:
	 cd ${TEST_PROJ} && make status_bypass
test_test_state:
	 cd ${TEST_PROJ} && make test_state

.PHONY: test_showconf test_showinfo
test_showconf:
	 cd ${TEST_PROJ} && make showconf

test_showinfo:
	 cd ${TEST_PROJ} && make showinfo
