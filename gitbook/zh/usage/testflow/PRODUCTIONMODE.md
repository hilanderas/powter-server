# Test flow in production mode

### Login server and install dependency
* Update system
```bash
sudo apt update -y
```

* Install `make` `tree` `unzip` `iftop`
```bash
sudo apt install build-essential tree unzip iftop -y
```

* Install docker-ce
```bash
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
sudo apt update -y
sudo apt install docker-ce -y
sudo usermod -aG docker $USER
```

* Install docker-compose
```bash
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```
* Reboot server
```bash
sudo reboot
```

###  Download powter-server testflow packages
```bash
wget https://github.com/hilanderas/powter-server/releases/download/0.1.2/powter-server-testflow-0.1.2.zip
unzip powter-server-testflow-0.1.2.zip
```
[Check releases page for other versions](https://github.com/hilanderas/powter-server/releases)

### Download powter-server packages
```bash
cd powter-server-testflow
make download
```

### Config test environment
* Update `info.yml` in `powter-server-testflow` to meet your test environment

* Set project path, info file path and lan port 
```bash
make config PROJ=[PROJECT] IFACE=[IFACE]
```
Description of each attribute:
* `PROJ`: Path of `power-server`
* `IFACE`: Interface of server

	e.g,
```bash
make config PROJ=$PWD/powter-server IFACE=eth0
```

* Check configuration
```bash
make -s read_config
```

### Run test flow

* Preparation before test
```bash
make test_prepare
```
* Update `info.yml` to meet your test environment

* Install
```bash
make test_install INFO=$PWD/info.yml
```

* Uninstall
```bash
make test_uninstall
```

* Install after uninstall
```bash
make test_installafteruninstall
```

* Reinstall
```bash
make test_reinstall
```

* Reuninstall
```bash
make test_reuninstall
```

* Test other scenarios
	* test_before_reboot  
	* test_after_reboot 
	* test_restartall 
	* test_updateconf_dns 
	* test_updateconf_sskcp
	* test_checkconfig

* Clean up
```bash
make cleanup
```
