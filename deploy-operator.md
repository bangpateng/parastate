<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
<a href="https://bangpateng.com/" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/38981255/184068977-2d456b1a-9b50-4b75-a0a7-4909a7c78991.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/184852284-08b36261-236b-4027-bdc3-487858eb09c7.png">
</p>

# SAFESTAKE TESTNET INCENTIVIZED (ParaState)

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

## Update Sistem
```
sudo apt-get update
sudo apt install git sudo unzip wget -y
```
## Add All Port
```
sudo ufw allow 25000:25003/tcp
sudo ufw allow 9000/tcp
sudo ufw allow 8545:8547/tcp
sudo ufw allow 25004/udp
sudo ufw allow 22/tcp
sudo ufw allow 3000:3001/tcp
sudo ufw allow 80/tcp
sudo ufw allow 30303/tcp
sudo ufw allow 9000/udp
sudo ufw enable
```
## Instal Docker Engine
```
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
```
## Install Docker Compose
```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock
```
## Create local volume directory
```
sudo mkdir -p /data/geth
sudo mkdir -p /data/lighthouse
sudo mkdir -p /data/jwt
sudo mkdir -p /data/operator
```
## Generate your jwt secret to jwt dirctory
```
openssl rand -hex 32 | tr -d "\n" | sudo tee /data/jwt/jwtsecret
```
## Clone operator code from github
```
git clone --recurse-submodules https://github.com/ParaState/SafeStakeOperator.git dvf
```
## konfigurasikan Ini memiliki nilai default dalam kode sumber terbaru
```
cd dvf
vim .env
```
Simpan Ketik ESC Ketik :wq dan ENTER

## Build operator image (Tunggu Selesai Kurang dari 1 Jam)
```
sudo docker compose -f docker-compose-operator.yml build
```
## Run Your Operator
```
sudo docker compose -f docker-compose-operator.yml up -d
```
## Get your operator public key
```
sudo docker compose -f docker-compose-operator.yml logs -f operator | grep "node public key"
```
Simpan Balasan Out Pun Yang Keluar (Akan Terpakai)

## Back up your operator private key file

Berada di Path
```
cd /data/operator/ropsten/
nano node_key.json
```
Simpan dan Backup di Tempat Aman

## Daftar Menjadi Operator

- Pastikan Kalian Sudah Memiliki Akun Metamask
- Pindahkan Jaringan ke Ropsten
- Claim Faucet di : [https://faucet.egorfine.com/](https://faucet.egorfine.com/ "https://faucet.egorfine.com/")
- Harus Ada Sekitar 32 ETH (Iblis Aja Beberapa Akun Satuin)
- Buka Situs Operator : [https://testnet.safestake.xyz/](https://testnet.safestake.xyz/ "https://testnet.safestake.xyz/")

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184920526-534753af-e825-4d22-9406-4bb9ad56dfea.PNG">
</p>

- Connect Wallet
- Klik `Join As Operator`

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184920536-64cba417-7653-45e5-8c38-41513eeaace9.PNG">
</p>

- Klik `Regist Operator`

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184920544-319b6b73-8607-4ff7-b4d2-bbeec2e4fb45.PNG">
</p>

- Display Name (Masukan Nama Operator kalian Bebas)
- Publik Key (Masukan Dengan Publik Key yang Sebelumnya Sudah Kita Simpan)

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184921013-df0ec6c7-846c-4821-a893-8162cf02bd17.PNG">
</p>

- Klik Next dan Register Operator dan Approve Transaksi Via Metamask

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184920549-b77fb9d6-2e41-4125-9d70-a33f209e570e.PNG">
 
- Check di Explorer, Congrats Ada Operator Kalian
