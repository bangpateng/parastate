<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
<a href="https://bangpateng.com/" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/38981255/184068977-2d456b1a-9b50-4b75-a0a7-4909a7c78991.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/184852284-08b36261-236b-4027-bdc3-487858eb09c7.png">
</p>

# SAFESTAKE TESTNET INCENTIVIZED (ParaState)

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184885414-00bd81fe-accd-4e1d-b6f1-829fd686db69.PNG">
</p>

## Buat direktori volume lokal
```
cd
sudo mkdir -p /data/geth
sudo mkdir -p /data/lighthouse
sudo mkdir -p /data/jwt
sudo mkdir -p /data/operator
```
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184885407-213046c0-e4f2-4c9e-94a0-c02b7522f3a5.PNG">
</p>

## Hasilkan rahasia jwt Anda ke direktori jwt
```
openssl rand -hex 32 | tr -d "\n" | sudo tee /data/jwt/jwtsecret
```
Salin Code Sampai Sebelum root (Simpan Aja)

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184886842-72547c3c-57a1-474b-a5e9-4e64d8b3d4d5.PNG">
</p>

## Isi dan Ganti enr yang ada dengan enr yang anda dapatkan di Step Sebelumnya
```
cd SafeStakeOperator
vim .env
```

Tekan `i` lalu arahkan ke ujung tulisan dan hapus sampai sebelum `ENR=enr:` paste enr yg sebelumnya sudah kalian backup lalu SAVE Tekan `ESC` lalu masukkan perintah `:wq` lalu `ENTER`

## Build Docker
```
sudo docker compose -f docker-compose-operator.yml build
```
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184919944-b14d78af-6877-4307-8467-6f98bd16e68f.png">
</p>

Tunggu dan Biarkan Instalisasi Selesai Sekitar 1 Jam Lebih (Tergantung Kecepatan Sinyal Internet Kalian)

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184919961-5725fb53-3895-4b79-a1f8-38b812af5dea.PNG">
</p>

```
sudo docker compose -f docker-compose-operator.yml up -d
```
<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184919957-8aa2c16e-273d-4e43-822f-9927ebeccb85.png">
</p>

```
sudo docker compose -f docker-compose-operator.yml logs -f operator | grep "node public key"
```
## Back up your operator private key file

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/184949319-d29b3fa8-d47b-48b8-b79a-f16955381de2.png">
</p>

Berada di Path Back up your operator private key file
```
/data/operator/ropsten/node_key.json
```
Kalau Kalian Menggunakan Mobaxterms, Tinggal Cari Aja di Search Paste Perintah di atas

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
