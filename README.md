<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
<a href="https://bangpateng.com/" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/38981255/184068977-2d456b1a-9b50-4b75-a0a7-4909a7c78991.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/184852284-08b36261-236b-4027-bdc3-487858eb09c7.png">
</p>

## Update Sistem
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847525-0741dddb-227b-4ff5-86a4-e72533f7963f.PNG">
</p>

```
sudo apt-get update
```
```
sudo apt install git sudo unzip wget -y
```
## Clone Repository
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847524-a54ab9a9-40b2-4f54-b2f6-6b2e933d3270.PNG">
</p>

```
git clone --recurse-submodules https://github.com/ParaState/SafeStakeOperator
cd SafeStakeOperator
```
#install docker
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847520-0001a1af-a203-480d-bf49-bb7d95bff7a0.PNG">
</p>

```
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
```
## install docker-compose
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847512-2e7ccbf3-51b4-485d-b5fe-08578bbf6ae3.PNG">
</p>

```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock
```
## Jalankan Docker
```
sudo docker compose -f docker-compose-boot.yml build
```
Tahap Ini Lumayan Lama, Jadi Tunggu Aja Hingga Kelar
```
sudo docker compose -f docker-compose-boot.yml up -d
```
```
docker-compose -f docker-compose-boot.yml logs -f dvf_root_node | grep enr
```

MASIH BERLANJUT NEXT STEP (DEPLOY OPERATOR) : 