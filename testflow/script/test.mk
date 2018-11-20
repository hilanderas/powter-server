#!make
#.EXPORT_ALL_VARIABLES:
#
#MY_VAR = foo
#
#test:
#	@echo $$MY_VAR
export TEST
VARIABLE=echo $$TEST
.PHONY: all
all:
	$(VARIABLE)
