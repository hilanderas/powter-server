# Test flow in development mode

###  Git clone
```bash
git clone https://github.com/hilanderas/powter-server.git
```

### Set as development mode
* Set mode
```bash
cd powter-server/testflow/script
make set_mod TESTMODE=dev
```

* Read mode
```bash
make -s read_mod
```


### Initial configuration
```bash
make init_config PROJ=[PROJ]
```
`PROJ`: Path of `power-server/ctl`
e.g,
```bash
make init_config PROJ=/home/qa/powter-server/ctl
```
n
### Run test flow
* Preparation before test
```bash
make test_prepare
```

* Install

	Update `/home/USER` in default info.yml 
```bash
make test_install
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