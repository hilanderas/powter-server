#!make
include .env   .powter-server.env 
.PHONY: test_prepare test_remove
test_prepare:
	make -f basic.mk hint CONTENT="test prepare"
	make -C ${TEST_PROJ} prepare || true 
	make test_test_state

test_remove:
	make -f basic.mk hint CONTENT="test remove"
	make -C ${TEST_PROJ} remove || true
	make test_test_state

.PHONY: test_install test_uninstall test_update
test_install:
	make -f basic.mk hint CONTENT="test install"
	make -C ${TEST_PROJ} install INFO=${TEST_INFO} || true
	make test_test_state

test_uninstall:
	make -f basic.mk hint CONTENT="test uninstall"
	make -C ${TEST_PROJ} uninstall || true
	make test_test_state

test_update:
	make -f basic.mk hint CONTENT="test update"
	make -C ${TEST_PROJ} update || true
	make test_test_state

.PHONY: test_genconf test_setconf test_restoreconf test_rmconf
test_genconf:
	make -f basic.mk hint CONTENT="test genconf"
	make -C ${TEST_PROJ} gen_config INFO=${TEST_INFO} || true
	make test_test_state

test_setconf:
	make -f basic.mk hint CONTENT="test setconf"
	make -C ${TEST_PROJ} set_config || true
	make test_test_state
test_rmconf:	
	make -f basic.mk hint CONTENT="test rmconfig"
	make -C ${TEST_PROJ} rm_config || true
	make test_test_state
	
test_popconf:
	make -f basic.mk hint CONTENT="test popconfig"
	make -C ${TEST_PROJ} pop_config || true
	make test_test_state

test_restoreconf:
	make -f basic.mk hint CONTENT="test restoreconf"
	make -C ${TEST_PROJ} restore_config || true
	make test_test_state

.PHONY: test_start test_stop test_restart test_restart_sskcp test_restart_dns test_restart_bypass
test_start: 
	make -f basic.mk hint CONTENT="test start"	
	make -C ${TEST_PROJ} start || true
	make test_test_state

test_stop:
	make -f basic.mk hint CONTENT="test stop"
	make -C ${TEST_PROJ} stop || true
	make test_test_state

test_restart:	
	make -f basic.mk hint CONTENT="test restart"
	make -C ${TEST_PROJ} restart	|| true
	make test_test_state

test_restart_sskcp:
	make -f basic.mk hint CONTENT="test restart sskcp"
	make -C ${TEST_PROJ} restart_sskcp || true
	make test_test_state
test_restart_dns:
	make -f basic.mk hint CONTENT="test restart dns"
	make -C ${TEST_PROJ} restart_dns || true
	make test_test_state
test_restart_bypass:
	make -f basic.mk hint CONTENT="test restart bypass"
	make -C ${TEST_PROJ} restart_bypass || true
	make test_test_state

.PHONY: test_status test_state
test_status:
	make -f basic.mk hint CONTENT="test status"
	make -C ${TEST_PROJ} status 
	make -f basic.mk confirm 

test_status_sskcp:
	make -f basic.mk hint CONTENT="test status sskcp"
	make -C ${TEST_PROJ} status_sskcp 
	make -f basic.mk confirm 

test_status_dns:
	make -f basic.mk hint CONTENT="test status dns"
	make -C ${TEST_PROJ} status_dns
	make -f basic.mk confirm 

test_status_bypass:
	make -f basic.mk hint CONTENT="test status bypass"
	make -C ${TEST_PROJ} status_bypass
	make -f basic.mk confirm 

test_test_state:
	make -f basic.mk hint CONTENT="test test state"
	make -C ${TEST_PROJ} test_state
	make -f basic.mk confirm 

.PHONY: test_showconf test_showinfo
test_showconf:
	make -f basic.mk hint CONTENT="test showconf"
	make -C ${TEST_PROJ} showconf 
	make -f basic.mk confirm 

test_showinfo:
	make -f basic.mk hint CONTENT="test showinfo"
	make -C ${TEST_PROJ} showinfo 
	make -f basic.mk confirm 
