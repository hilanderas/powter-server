# Deployment

### Download powter-server and unzip
```bash
wget  https://github.com/hilanderas/powter-server/releases/download/0.1.3/powter-server-0.1.3.zip
unzip powter-server-0.1.3.zip
```

### Install powter-server
A `info` file will pop up during installation, update `USER`, `WAN` and enter `:wq` to save and quit
```bash
cd powter-server
make install
```

### Check status after installation
```bash
make status
```

