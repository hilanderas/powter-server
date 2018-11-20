#!/bin/bash 
source .env

hint() {
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "${GREEN}=================================${NC}\n"
    printf "${GREEN}$1${NC}\n"
    printf "${GREEN}=================================${NC}\n"

}

netflow() {
   
	sudo iftop -i ${LAN} -NnP -t -s 1
}

confirm() {
    while true; do
        read -p "Do you wish to continue? [y/n]" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

re_boot() {
    hint "reboot"
		confirm 
    sudo reboot
}

config(){
	hint "Config"
	cd ${PROJ}
	if [ $1 ]
	then
		echo "make config INFO=${1} successfully"
		make config INFO=$1
		confirm
	else
		echo $INFO
		echo "make config successfully!"
		make config
		confirm
	fi
}

test_config(){
	hint "Test config"
	cd ${PROJ}
	if [ $1 ]
	then
		make test_config INFO=$1
		confirm
	else
		make test_config
		confirm
	fi
}

ctl(){
	cmd=${1}
	service=${2}
	hint "${cmd} ${service}"
	cd ${PROJ}
	if [ ${service} ]  
	then
		make ${cmd}_${service}
		confirm
	else 
		make ${cmd}
		confirm
	fi
}



ns_lookup(){
	hint "nslookup $1"
#	nslookup $1 127.0.0.1
	nslookup $1
}
