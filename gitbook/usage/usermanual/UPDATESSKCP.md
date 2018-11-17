# Replace sskcp server

Sometimes vps used as sskcp server is in low performance or high latency, so you want to replace it to a new one. 


There are 2 ways to do this:
* Update `info` on line
* Update `info` with file provided by user


### Modify info on line
* Modify  `vpsip`, `vpsport` and `key` in sskcp and save
```bash
make config
```

* Restart sskcp service
```bash
make restart_sskcp 
```

* Check status
```bash
make status_sskcp
```

### Modify info file
* Modify  `vpsip`, `vpsport` and `key` in sskcp and save
```bash
vi /path/to/info
```

* Generate configuration
```bash
make config INFO=/path/to/info INTERATION=no
```

* Restart sskcp service
```bash
make restart_sskcp 
```

* Check status
```bash
make status_sskcp
```