# info

`info` is used to customize user configuration of services. Users can modify it to meet their own requirements. 

There are 2 kinds of `info` in system
* info.yml - For service starting 
* info.queued.yml - For replacing info.yml

### Show info
* Show info 
```bash
make showinfo
```

* Show queued info
```bash
make show_queued_info
```

### Reset info to default
```bash
make reset_info
```


### `info` template 
```yml
dns-proxy:
  DNSPORT: 16350:16370
  WAN: eth0
sskcp:
  server:
		- { key: test, listenport: 7010, log-dir: /home/USER/snmplog, mode: sskcp }
		- { key: test, listenport: 7020, log-dir: /home/USER/snmplog, mode: sskcp }
```
** `info` is yaml file, check detailed info about how to modify `info` of [dns-proxy](https://elespejo.github.io/dns-proxy/usage/GENCONF.html), [sskcp](https://elespejo.github.io/sskcp/usage/GENCONF_SERVER.html)**
