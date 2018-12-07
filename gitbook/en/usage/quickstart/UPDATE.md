# Update

### When to update 
* Update sskcp service scale
* Update dns-proxy port range
* Update sskcp service key or port

### How to update
The most simple way to update configuration is using `update`, which will change the default `INFO` in power-server/server and restart all services 
```bash
make update
``` 

**Note that `info` can also be provided to update, like below:**
```bash
make update INFO=/path/to/info
```

### Check status and configuration after updating
* Check whether configuration updated
```bash
make showconf
```

* Check status of running services 
```bash
make test_state
```
