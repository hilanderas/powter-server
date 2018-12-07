#!make
include Makefile

.PHONY: test_init test_prepared test_conf_generated test_conf_ready test_conf_queued test_running

test_init:
	make test_remove || true
	make test_genconf || true
	make test_rmconf || true
	make test_setconf || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
	make test_popconf || true
test_prepared:
	make test_prepare || true
	make test_rmconf || true
	make test_setconf || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
	make test_popconf || true
	make test_remove || true
test_confgened: 
	make test_prepare || true
	make test_genconf || true
	make test_prepare || true
	make test_remove || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
	make test_popconf || true
	make test_rmconf || true
	make test_remove || true
make test_confready: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_prepare || true
	make test_remove || true
	make test_genconf || true
	make test_rmconf || true
	make test_setconf || true
	make test_stop || true
	make test_restart || true
	make test_popconf || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_confqueued_pop_branch: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_genconf || true
	make test_prepare || true
	make test_remove || true
	make test_setconf || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
	make test_popconf || true
	make test_start || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_confqueued_rm_branch: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_genconf || true
	make test_prepare || true
	make test_remove || true
	make test_setconf || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restart || true
	make test_rmconf || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_running: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_prepare || true
	make test_remove || true
	make test_rmconf || true
	make test_setconf || true
	make test_restoreconf || true
	make test_start || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
.PHONY: 
test_init_norm: 
	make test_prepare || true
	make test_remove || true
test_prepared_norm: 
	make test_prepare || true
	make test_prepare || true
	make test_genconf || true
	make test_rmconf || true
	make test_remove || true
test_confgened_norm:
	make test_prepare || true
	make test_genconf || true
	make test_genconf || true
	make test_setconf || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_confready_norm: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_running_norm: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_restart || true
	make test_genconf || true
	make test_rmconf || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
test_confqueued_norm: 
	make test_prepare || true
	make test_genconf || true
	make test_setconf || true
	make test_start || true
	make test_genconf || true
	make test_genconf || true
	make test_rmconf || true
	make test_genconf || true
	make test_popconf || true
	make test_start || true
	make test_stop || true
	make test_restoreconf || true
	make test_rmconf || true
	make test_remove || true
