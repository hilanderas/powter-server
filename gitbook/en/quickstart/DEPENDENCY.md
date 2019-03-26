# Dependency

### Install unzip, tree, iftop, make
```bash
sudo apt install build-essential tree unzip iftop -y
```

### Install Docker CE 18.06
* [Install docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* Add current user to docker group after installation
```bash
sudo usermod -aG docker $USER
```

### Install docker-compose
Please refer to the [reference](https://docs.docker.com/compose/install/)
