# info

`info` is used to customize user configuration of services. Users can modify it to meet their own requirements. 


### `info` template 
```yml
dns-proxy:
  DNSPORT: 12345:12356
  WAN: enp0s25
sskcp:
  server:
  - key: test1
    listenport: 7010
    log-dir: /home/USER/log
    mode: sskcp
  - key: test2
    listenport: 7020
    log-dir: /home/USER/log
    mode: sskcp
```
`info` is yaml file and you can test whether it is ok after modification with:
	
```
cd powter-server
make test_info INFO=path/to/info
```

Detailed info about how to modify `info` of [dns-proxy](https://elespejo.github.io/dns-proxy/usage/GENCONF.html), [sskcp](https://elespejo.github.io/sskcp/usage/GENCONF.html) 