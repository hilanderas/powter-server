# Deployment
<iframe frameborder="0" width="100%" height="450" src="https://www.dailymotion.com/embed/video/x74reht" allowfullscreen allow="autoplay"></iframe>
Music by [Ilya Truhanov](https://icons8.com/music/author/ilya-truhanov) from [Fugue](https://icons8.com/music)

### Download powter-server and unzip
```bash
wget  https://github.com/hilanderas/powter-server/releases/download/0.3.1/powter-server-0.3.1.zip
unzip powter-server-0.3.1.zip
```
### Check info for installation
An `info` file will pop up during installation, update `USER`, `WAN` and enter `:wq` to save and quit, click [here](../usermanual/INFO.md) to get more details about info.

### Install powter-server
```bash
cd powter-server
make install
```

### Check status after installation
```bash
make status
```

