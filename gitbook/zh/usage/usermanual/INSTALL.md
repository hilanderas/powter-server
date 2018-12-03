# Install
There are 2 ways to install powter-server:
* One key installation
```bash
make install
```
* Install step by step like below:
##### Download powter-server
```bash
wget  https://github.com/hilanderas/powter-server/releases/download/[VERSION]/powter-server-m.n.p.zip
```
##### Download images, confgenerator, images API for 2 projects
```bash
make prepare
```
##### Test whether download resources successfully
```bash
make test_prepare
```
##### Generate configuration
Provide `info` file, you will be asked to edit it on line, just enter `:wq` to save the file if you don't need to modify it.
```bash
make config INFO=path/to/info
```
Please note that if `info` is not provided, a default one will pop up and you can edit it on line before save.
```bash
make config
```
##### If you want script keep running without stopping, add `INTRERACTION=false` at the end of the command (not applicable)
```bash
make config INFO=path/to/info INTRERACTION=false
```
##### Test configuration generated
```bash
make test_config
```
##### Start services
```bash
make start
```