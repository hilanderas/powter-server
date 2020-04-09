# Test flow in production mode

###  Download powter-server testflow packages
```bash
wget https://github.com/hilanderas/powter-server/releases/download/0.2.0/powter-server-testflow-0.2.0.zip
unzip powter-server-testflow-0.2.0.zip
```
[Check releases page for other versions](https://github.com/hilanderas/powter-server/releases)

### Download powter-server packages
```bash
cd powter-server-testflow
make -f basic.mk download
```

### Config test environment
* Set lan port 
```bash
make -f powter-server.mk config IFACE=[IFACE]
```
Description of the attribute:
* `IFACE`: WAN of server

	e.g,
```bash
make -f powter-server.mk config IFACE=eth0
```

* Check configuration
```bash
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
