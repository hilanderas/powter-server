#!make 

include .powter-server.env

netflow:
		sudo iftop -i ${IFACE} -NnP -t -s 1


