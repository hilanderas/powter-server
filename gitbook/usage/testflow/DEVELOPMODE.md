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

	Update `/home/USER` in default info.yml 
```bash
make test_uninstall
```

* Install after uninstall

	Update `/home/USER` in default info.yml 
```bash
make test_installafteruninstall
```

* Reinstall

	Update `/home/USER` in default info.yml 
```bash
make test_reinstall
```

* Reuninstall

	Update `/home/USER` in default info.yml 
```bash
make test_reuninstall
```


* Clean up
```bash
make cleanup
```