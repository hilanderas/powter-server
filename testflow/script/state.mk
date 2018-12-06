#!make
include interface.mk

.PHONY: test_init test_prepared test_conf_generated test_conf_ready test_conf_queued test_running

test_init:
	make test_remove
	make test_gen_conf
	make test_rm_conf
	make test_set_conf
	make test_restore_conf
	make test_start
	make test_stop
	make test_restart
	make test_pop_config
test_prepared:
	make test_prepare
	make test_rm_conf
	make test_set_conf
	make test_restore_conf
	make test_start
	make test_stop
	make test_restart
	make test_pop_config
	make test_remove
test_confgened:
	make test_prepare
	make test_gen_conf
	make test_prepare
	make test_remove
	make test_restore_conf
	make test_start
	make test_stop
	make test_restart
	make test_pop_config
	make test_rm_conf
	make test_remove
make test_confready:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_prepare
	make test_remove
	make test_gen_conf_1
	make test_rm_conf
	make test_set_conf
	make test_stop
	make test_restart
	make test_pop_config
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_confqueued_pop_branch:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_gen_conf_1
	make test_prepare
	make test_remove
	make test_set_conf
	make test_restore_conf
	make test_start
	make test_stop
	make test_restart
	make test_pop_config
	make test_start_1
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_confqueued_rm_branch:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_gen_conf_1
	make test_prepare
	make test_remove
	make test_set_conf
	make test_restore_conf
	make test_start
	make test_stop
	make test_restart
	make test_rm_conf
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_running:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_prepare
	make test_remove
	make test_rm_conf
	make test_set_conf
	make test_restore_conf
	make test_start
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
.PHONY:
test_init_norm:
	make test_prepare
	make test_remove
test_prepared_norm:
	make test_prepare
	make test_prepare
	make test_gen_conf
	make test_rm_conf
	make test_remove
test_confgened_norm:
	make test_prepare
	make test_gen_conf
	make test_gen_conf
	make test_set_conf
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_confready_norm:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_running_norm:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_restart
	make test_gen_conf_1
	make test_rm_conf
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
test_confqueued_norm:
	make test_prepare
	make test_gen_conf
	make test_set_conf
	make test_start
	make test_gen_conf_1
	make test_gen_conf_2
	make test_rm_conf
	make test_gen_conf_3
	make test_pop_config
	make test_start
	make test_stop
	make test_restore_conf
	make test_rm_conf
	make test_remove
