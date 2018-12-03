# Deployment

### Download powter-server and unzip
```bash
wget  https://github.com/hilanderas/powter-server/releases/download/0.1.2/powter-server-0.1.2.zip
unzip powter-server-0.1.2.zip
```

### Install powter-server
A `info` file will pop up during installation, update `USER`, `WAN` and enter `:wq` to save and quit
```bash
cd powter-server
make install
```

### Check status of powter-server
```bash
make status
```

