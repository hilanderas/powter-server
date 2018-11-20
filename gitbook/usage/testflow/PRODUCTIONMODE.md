# Test flow in production mode

###  Login router and download powter-client testflow packages
```bash
wget https://github.com/hilanderas/powter-server/releases/download/0.1.1/powter-server-testflow-0.1.1.zip
unzip powter-client-testflow-0.1.1.zip
```
[Check releases page for other versions](https://github.com/hilanderas/powter-server/releases)

### Download powter-client packages
```bash
cd powter-server-testflow
make download
```

### Config test environment
* Update `info.yml` in `powter-server-testflow` to meet your test environment

* Set project path, info file path and lan port 
```bash
make config PROJ=[PROJECT] LAN=[LAN]
```
Description of each attribute:
* `PROJ`: Path of `power-server`
* `LAN`: Lan port of router

	e.g,
```bash
make config PROJ=$PWD/powter-server LAN=eth0
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


* Clean up
```bash
make cleanup
```