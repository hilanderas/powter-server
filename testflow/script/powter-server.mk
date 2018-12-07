#!make 

include .powter-server.env
LIB_PS=.powter-server.env

netflow:
	sudo iftop -i ${IFACE} -NnP -t -s 1

config:
	sed -i '/TEST_INFO/c\export TEST_INFO=${TEST_INFO}' ${LIB_PS}
	sed -i '/IFACE/c\export IFACE=${IFACE}' ${LIB_PS}

reset_config:
	sed -i '/TEST_INFO/c\export TEST_INFO=${PWD}/info.yml' ${LIB_PS}
	sed -i '/IFACE/c\export IFACE=eth0' ${LIB_PS}
	cat ${LIB_PS}

read_config:
	cat ${LIB_PS}	

