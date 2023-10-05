initialize a vagrant file with `bento/ubuntu-22.04` VM

```bash
# 
vagrant init bento/ubuntu-22.04

# launch VM
vagrant up

# login to VM
vagrant ssh
```
___

Install Docker Engine on ubuntu VM

```bash

# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update -y

# Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# add vagrant to docker group
sudo usermod -aG docker vagrant

```
___

build docker

```bash
docker compose build

docker compose up -d

[+] Running 17/17
 ✔ vpromq01 9 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                      37.5s
   ✔ 37aaf24cf781 Pull complete                                                                              24.6s
   ✔ 83098b347fe1 Pull complete                                                                              28.1s
   ✔ 20a8bc3103c9 Pull complete                                                                               8.7s
   ✔ e5d9c00f6aeb Pull complete                                                                               9.5s
   ✔ faf31d35f1dd Pull complete                                                                              33.7s
   ✔ ed3305cdb865 Pull complete                                                                              25.3s
   ✔ c94d30d3af7f Pull complete                                                                              26.1s
   ✔ dd90db7491a5 Pull complete                                                                              26.9s
   ✔ 9dfd185b71c0 Pull complete                                                                              28.4s
 ✔ vprocache01 6 layers [⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                                      41.0s
   ✔ a803e7c4b030 Already exists                                                                              0.0s
   ✔ e55b6d03e158 Pull complete                                                                              28.9s
   ✔ 9b87769fc9f1 Pull complete                                                                              30.8s
   ✔ 3f8eac2c3e6f Pull complete                                                                              37.2s
   ✔ 85833ea2350a Pull complete                                                                              31.6s
   ✔ 241a00a172e5 Pull complete                                                                              33.9s
[+] Running 8/8
 ✔ Network vprofile-project_default          Created                                                          0.1s
 ✔ Volume "vprofile-project_vprodbdata"      Created                                                          0.0s
 ✔ Volume "vprofile-project_vproappdata"     Created                                                          0.0s
 ✔ Container vproapp                         Started                                                          0.4s
 ✔ Container vproweb                         Started                                                          0.2s
 ✔ Container vprodb                          Started                                                          0.2s
 ✔ Container vprofile-project-vprocache01-1  Started                                                          0.2s
 ✔ Container vprofile-project-vpromq01-1     Started                                                          0.2s

```
___

push imges to docker hub

```bash
docker push mmsaeed509/vprofileapp
docker push mmsaeed509/vprofileweb
docker push mmsaeed509/vprofiledb
```
___

clean

```bash
docker compose down
docker system prune -a
```