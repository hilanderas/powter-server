#!make
include Makefile

.PHONY: test_init test_prepared test_conf_generated test_conf_ready test_conf_queued test_running

test_init:
	make test_remove
	make test_genconf
	make test_rmconf
	make test_setconf
	make test_restoreconf
	make test_start
	make test_stop
	make test_restart
	make test_popconf
test_prepared:
	make test_prepare
	make test_rmconf
	make test_setconf
	make test_restoreconf
	make test_start
	make test_stop
	make test_restart
	make test_popconf
	make test_remove
test_confgened:
	make test_prepare
	make test_genconf
	make test_prepare
	make test_remove
	make test_restoreconf
	make test_start
	make test_stop
	make test_restart
	make test_popconf
	make test_rmconf
	make test_remove
make test_confready:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_prepare
	make test_remove
	make test_genconf
	make test_rmconf
	make test_setconf
	make test_stop
	make test_restart
	make test_popconf
	make test_restoreconf
	make test_rmconf
	make test_remove
test_confqueued_pop_branch:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_genconf
	make test_prepare
	make test_remove
	make test_setconf
	make test_restoreconf
	make test_start
	make test_stop
	make test_restart
	make test_popconf
	make test_start
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
test_confqueued_rm_branch:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_genconf
	make test_prepare
	make test_remove
	make test_setconf
	make test_restoreconf
	make test_start
	make test_stop
	make test_restart
	make test_rmconf
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
test_running:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_prepare
	make test_remove
	make test_rmconf
	make test_setconf
	make test_restoreconf
	make test_start
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
.PHONY:
test_init_norm:
	make test_prepare
	make test_remove
test_prepared_norm:
	make test_prepare
	make test_prepare
	make test_genconf
	make test_rmconf
	make test_remove
test_confgened_norm:
	make test_prepare
	make test_genconf
	make test_genconf
	make test_setconf
	make test_restoreconf
	make test_rmconf
	make test_remove
test_confready_norm:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
test_running_norm:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_restart
	make test_genconf
	make test_rmconf
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
test_confqueued_norm:
	make test_prepare
	make test_genconf
	make test_setconf
	make test_start
	make test_genconf
	make test_genconf
	make test_rmconf
	make test_genconf
	make test_popconf
	make test_start
	make test_stop
	make test_restoreconf
	make test_rmconf
	make test_remove
