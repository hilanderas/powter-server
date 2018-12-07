#!make
include .env  main.mk 
.PHONY: test_prepare test_remove
test_prepare:
	make hint CONTENT="test prepare"
	cd ${TEST_PROJ} && make prepare || true 
	make test_test_state

test_remove:
	make hint CONTENT="test remove"
	cd ${TEST_PROJ} && make remove || true
	make test_test_state

.PHONY: test_install test_uninstall test_update
test_install:
	make hint CONTENT="test install"
	cd ${TEST_PROJ} && make install || true
	make test_test_state

test_uninstall:
	make hint CONTENT="test uninstall"
	cd ${TEST_PROJ} && make uninstall || true
	make test_test_state

test_update:
	make hint CONTENT="test update"
	cd ${TEST_PROJ} && make update || true
	make test_test_state

.PHONY: test_genconf test_setconf test_restoreconf test_rmconf
test_genconf:
	make hint CONTENT="test genconf"
	cd ${TEST_PROJ} && make gen_config || true
	make test_test_state

test_setconf:
	make hint CONTENT="test setconf"
	cd ${TEST_PROJ} && make set_config || true
	make test_test_state
test_rmconf:	
	make hint CONTENT="test rmconfig"
	cd ${TEST_PROJ} && make rm_config || true
	make test_test_state
	
	
	
test_popconf:
	make hint CONTENT="test popconfig"
	cd ${TEST_PROJ} && make pop_config || true
	make test_test_state

test_restoreconf:
	make hint CONTENT="test restoreconf"
	cd ${TEST_PROJ} && make restore_config || true
	make test_test_state

.PHONY: test_start test_stop test_restart test_restart_sskcp test_restart_dns test_restart_bypass
test_start: 
	make hint CONTENT="test start"	
	cd ${TEST_PROJ} && make start || true
	make test_test_state

test_stop:
	make hint CONTENT="test stop"
	cd ${TEST_PROJ} && make stop || true
	make test_test_state

test_restart:	
	make hint CONTENT="test restart"
	cd ${TEST_PROJ} && make restart	|| true
	make test_test_state

test_restart_sskcp:
	make hint CONTENT="test restart sskcp"
	cd ${TEST_PROJ} && make restart_sskcp || true
	make test_test_state
test_restart_dns:
	make hint CONTENT="test restart dns"
	cd ${TEST_PROJ} && make restart_dns || true
	make test_test_state
test_restart_bypass:
	make hint CONTENT="test restart bypass"
	cd ${TEST_PROJ} && make restart_bypass || true
	make test_test_state

.PHONY: test_status test_state
test_status:
	make hint CONTENT="test status"
	cd ${TEST_PROJ} && make status 
	make confirm 

test_status_sskcp:
	make hint CONTENT="test status sskcp"
	cd ${TEST_PROJ} && make status_sskcp 
	make confirm 

test_status_dns:
	make hint CONTENT="test status dns"
	cd ${TEST_PROJ} && make status_dns
	make confirm 

test_status_bypass:
	make hint CONTENT="test status bypass"
	cd ${TEST_PROJ} && make status_bypass
	make confirm 

test_test_state:
	make hint CONTENT="test test state"
	cd ${TEST_PROJ} && make test_state
	make confirm 

.PHONY: test_showconf test_showinfo
test_showconf:
	make hint CONTENT="test showconf"
	cd ${TEST_PROJ} && make showconf 
	make confirm 

test_showinfo:
	make hint CONTENT="test showinfo"
	cd ${TEST_PROJ} && make showinfo 
	make confirm 
