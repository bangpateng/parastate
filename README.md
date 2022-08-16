<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
<a href="https://bangpateng.com/" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/38981255/184068977-2d456b1a-9b50-4b75-a0a7-4909a7c78991.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/184852284-08b36261-236b-4027-bdc3-487858eb09c7.png">
</p>

# SAFESTAKE TESTNET (ParaState)
## Get Started

In our eco-system, validators are delegating their tasks to operators and there is no need for deployment of validators. Therefore, we will discuss below two relevant deployment sections, one for *SafeStake Service Provider*, and one for *Operator*. Please only read the corresponding section for your deployment.

### Depoly SafeStake Service Provider

SafeStake service provider contains several components:

- A web server and frontend

- A nodejs backend (for necessary communication with operators)

- A root node service (for peer discovery in a p2p network)

#### Root Node Service

The duty agreement (using Hotstuff) among operators requires that these operators know IP of each other in a p2p network. Therefore, SafeSake provides a root node such that operators can consult and join the p2p network.

#### Dependencies

 * Public Static Network IP 
 * Hardware(recommend)
   * CPU: 4
   * Memory: 8G
   * Disk: 200GB
 * OS
   * Unix
 * Software
   * Docker
   * Docker Compose 

## 1. Update Sistem
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847525-0741dddb-227b-4ff5-86a4-e72533f7963f.PNG">
</p>

```
sudo apt-get update
```
```
sudo apt install git sudo unzip wget -y
```
## 2. Clone Repository
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847524-a54ab9a9-40b2-4f54-b2f6-6b2e933d3270.PNG">
</p>

```
git clone --recurse-submodules https://github.com/ParaState/SafeStakeOperator
cd SafeStakeOperator
```
## 3. Install docker
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
## 4. Install docker-compose
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184847512-2e7ccbf3-51b4-485d-b5fe-08578bbf6ae3.PNG">
</p>

```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock
```
## 5. Jalankan Docker
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184858126-e4e7bcc7-acda-44f9-8d74-81e67ea6aa19.PNG">
</p>

```
sudo docker compose -f docker-compose-boot.yml build
```
**Tahap Ini Lumayan Lama, Jadi Tunggu Aja Hingga Kelar (Sekitar 1 Jam Lebih)**
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184858124-8e74a36e-6f74-4174-825c-297080a07caa.PNG">
</p>

```
sudo docker compose -f docker-compose-boot.yml up -d
```
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184858118-9937144f-6634-4091-8234-ea92047d5d30.PNG">
</p>

```
docker-compose -f docker-compose-boot.yml logs -f dvf_root_node | grep enr
```

**MASIH BERLANJUT NEXT STEP (DEPLOY OPERATOR) : ** Waiting Soonn