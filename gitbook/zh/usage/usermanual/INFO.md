# info

`info` is used to customize user configuration of services. Users can modify it to meet their own requirements. 


### `info` template 
```yml
dns-proxy:
  DNSPORT: 12345:12356
  WAN: enp0s25
sskcp:
  server:
    - {key: test, listenport: 7201, log-dir: /home/USER/log, mode: sskcp}
    - {key: test, listenport: 7202, log-dir: /home/USER/log, mode: sskcp}
    - {key: test, listenport: 7203, log-dir: /home/USER/log, mode: sskcp}
    - {key: test, listenport: 7204, log-dir: /home/USER/log, mode: sskcp}
```
`info` is yaml file and you can test whether it is ok with below command:
```
cd powter-server
make test_info INFO=path/to/info
```

Detailed info about how to modify `info` of [dns-proxy](https://elespejo.github.io/dns-proxy/usage/GENCONF.html), [sskcp](https://elespejo.github.io/sskcp/usage/GENCONF.html) 