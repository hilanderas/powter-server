# Replace dns server

Sometimes vps used as dns server is in low performance or high latency, so you want to replace it to a new one. 

There are 2 ways to do this:
* Update `info` on line
* Update `info` with file provided by user


### Modify info on line
* Modify  `ip` in dns-server in `info` popped up and save
```bash
make update
```

* Check status
```bash
make status
```

* Check whether configuration is updated
```bash
make showconf
```

### Modify info file
* Modify  `ip` in dns-server in `info` file and save
```bash
vi /path/to/info
```
* Update configuration
```bash
make update INFO=/path/to/info
```

* Check status
```bash
make status
```

* Check whether configuration is updated
```bash
make showconf
```