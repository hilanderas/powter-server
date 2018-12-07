# Test flow in production mode

###  Download powter-server testflow packages
```bash
wget https://github.com/hilanderas/powter-server/releases/download//powter-server-testflow-.zip
unzip powter-server-testflow-.zip
```
[Check releases page for other versions](https://github.com/hilanderas/powter-server/releases)

### Download powter-server packages
```bash
cd powter-server-testflow
make -f basic.mk download
```

### Config test environment
* Update `info.yml` in `powter-server-testflow` to meet your test environment

* Set project path, info file path and lan port 
```bash
make -f basic.mk config TEST_PROJ=[PROJECT]
make -f powter-server.mk config IFACE=[IFACE] TEST_INFO=[TEST_INFO]
```
Description of each attribute:
* `TEST_PROJ`: Path of `power-server`
* `IFACE`: WAN of server
* `TEST_INFO`: Path of info.yml

	e.g,
```bash
make -f basic.mk config TEST_PROJ=$PWD/powter-server 
make -f powter-server.mk config IFACE=eth0 TEST_INFO=$PWD/info.yml
```

* Check configuration
```bash
make -s -f basic.mk read_config
make -s -f powter-server.mk read_config
```

### Run test cases

* Run installation cases
```bash
 make -s -f function.mk install
 make -s -f function.mk uninstall
 make -s -f function.mk installafteruninstall
 make -s -f function.mk reinstall
 make -s -f function.mk reuninstall
```
* Run restart cases
```bash
 make -s -f function.mk reboot_p1
 make -s -f function.mk reboot_p2
 make -s -f function.mk restartall
```
* Run update cases
```bash
make -s -f function.mk updateconf
```
