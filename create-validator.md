<p style="font-size:14px" align="right">
<a href="https://t.me/bangpateng_group" target="_blank">Join our telegram <img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
<a href="https://bangpateng.com/" target="_blank">Visit our website <img src="https://user-images.githubusercontent.com/38981255/184068977-2d456b1a-9b50-4b75-a0a7-4909a7c78991.png" width="30"/></a>
</p>

<p align="center">
  <img height="150" height="auto" src="https://user-images.githubusercontent.com/38981255/184852284-08b36261-236b-4027-bdc3-487858eb09c7.png">
</p>

# CREATE VALIDATOR PASTIKAN IKUTI STEP DI BAWAH INI

## Installing Prerequisites
```
sudo apt -y update
sudo apt -y upgrade
```
## Instal prasyarat yang umum tersedia.
```
sudo apt -y install software-properties-common wget curl ccze
```
## Instal Geth
```
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt -y install geth
```
## Installing Lighthouse
```
cd ~
wget https://github.com/sigp/lighthouse/releases/download/v2.4.0/lighthouse-v2.4.0-x86_64-unknown-linux-gnu.tar.gz
tar xvf lighthouse-v2.4.0-x86_64-unknown-linux-gnu.tar.gz
rm lighthouse-v2.4.0-x86_64-unknown-linux-gnu.tar.gz
```
```
sudo cp ~/lighthouse /usr/local/bin
rm ~/lighthouse
```
## Membuat file token JWT

Buat file token JWT di lokasi netral dan buat agar dapat dibaca oleh semua orang. Kami akan menggunakan /var/lib/ethereum/jwttokenlokasi untuk menyimpan file token JWT.
```
sudo mkdir -p /var/lib/ethereum
openssl rand -hex 32 | tr -d "\n" | sudo tee /var/lib/ethereum/jwttoken
sudo chmod +r /var/lib/ethereum/jwttoken
```
## Mengonfigurasi simpul Geth Anda

Buat pengguna khusus untuk menjalankan Geth, buat direktori untuk menyimpan data dan tetapkan izin yang sesuai.
```
sudo useradd --no-create-home --shell /bin/false goeth
sudo mkdir -p /var/lib/goethereum
sudo chown -R goeth:goeth /var/lib/goethereum
```
Buat file konfigurasi layanan systemd untuk mengonfigurasi layanan node Geth.
```
sudo nano /etc/systemd/system/geth.service
```
Salin dan Masukan Perintah di Bawah
```
[Unit]
Description=Go Ethereum Client - Geth (Ropsten)
After=network.target
Wants=network.target

[Service]
User=goeth
Group=goeth
Type=simple
Restart=always
RestartSec=5
TimeoutStopSec=180
ExecStart=geth \
    --ropsten \
    --http \
    --datadir /var/lib/goethereum \
    --metrics \
    --metrics.expensive \
    --pprof \
    --authrpc.jwtsecret=/var/lib/ethereum/jwttoken

[Install]
WantedBy=default.target
```
simpan setelah selesai ( Ctrl+ X, Y, Enter).

Muat ulang systemd untuk mencerminkan perubahan dan memulai layanan. Periksa status untuk memastikannya berjalan dengan benar.
```
sudo systemctl daemon-reload
sudo systemctl start geth.service
sudo systemctl status geth.service
```
```
sudo systemctl enable geth.service
```
## Check Log Geth
```
sudo journalctl -f -u geth.service -o cat | ccze -A
```
Tekan Ctrl+ Cuntuk berhenti menampilkan pesan-pesan itu.

## Configuring your Lighthouse beacon node

Buat pengguna khusus untuk menjalankan node suar Lighthouse, buat direktori untuk menyimpan data, salin file testnet, dan tetapkan izin yang sesuai.
```
sudo useradd --no-create-home --shell /bin/false lighthousebeacon
sudo mkdir -p /var/lib/lighthouse
sudo chown -R lighthousebeacon:lighthousebeacon /var/lib/lighthouse
```
Buat file konfigurasi layanan systemd untuk mengonfigurasi layanan node suar Lighthouse.
```
sudo nano /etc/systemd/system/lighthousebeacon.service
```
Salin dan Masukan Perintah di Bawah
```
[Unit]
Description=Lighthouse Ethereum Client Beacon Node (Ropsten)
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=lighthousebeacon
Group=lighthousebeacon
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/lighthouse bn \
    --network ropsten \
    --datadir /var/lib/lighthouse \
    --staking \
    --execution-endpoints http://127.0.0.1:8551 \
    --metrics \
    --validator-monitor-auto \
    --checkpoint-sync-url=https://ropsten.checkpoint-sync.ethdevops.io \
    --jwt-secrets=/var/lib/ethereum/jwttoken

[Install]
WantedBy=multi-user.target
```
simpan setelah selesai ( Ctrl+ X, Y, Enter).
```
sudo systemctl daemon-reload
sudo systemctl start lighthousebeacon.service
sudo systemctl status lighthousebeacon.service
```
```
sudo systemctl enable lighthousebeacon.service
```
## Check Log lighthouse
```
sudo journalctl -f -u lighthousebeacon.service -o cat | ccze -A
```
Tekan Ctrl+ Cuntuk berhenti menampilkan pesan-pesan itu.

## Claim Faucet Ropsten

- Buka Link : https://faucet.egorfine.com/
- Paste Address Metamask Kalian
- Claim (Pastikan ada Sekitar 32 Lebih ETH Ropsten

## Membuat kunci validator Anda dan melakukan deposit

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185337095-5d6d592d-f0d0-4207-9aa0-1599773c1b75.PNG">
</p>

- Buka : https://github.com/stake-house/wagyu-key-gen/releases
- Download Yang File .exe (Walaupun Kita Menggunakan VPS Tetapi, Untuk Membuat Wallet Kita Pakai PC Windows)
- Setelah Kalian Download, Lalu Install

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185338969-c2864166-90fe-4546-9fd0-669c02a643c0.png">
</p>

- Buka Aplikasi Yang Sudah Kalian Instal dan Klik Create New Paste dan Simpan Pharse

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185338967-1960a00e-a53c-4158-b19c-37c96c42cdfe.PNG">
</p>

- Buat Password (Wajib di Ingat Akan Berguna Untuk Login Login)

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185338964-1588d76b-ef2d-4854-bcc7-25a194ee0c6e.PNG">
</p>

- Pilih Tempat Penyimpan Bebas

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185338963-6191affc-6323-4fb0-b034-5da2c9ffd617.PNG">
</p>

- Create Validator Key File

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185338955-d6dc56db-d8bc-45d0-b3f7-7b28ab16613f.PNG">
</p>

- Selesai, Nah Kita Akan Mendapatkan 2 File Json Deposit dan Keystore

## Next Step

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185341280-95789248-0c08-4175-84ea-6f7779ea36ee.PNG">
</p>

- Buka Link : [https://ropsten.launchpad.ethereum.org/en/overview](https://ropsten.launchpad.ethereum.org/en/overview "https://ropsten.launchpad.ethereum.org/en/overview")
- Next Step Terus Lalu Continue

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185341272-02806413-c005-4071-addc-dcb41fdbca6e.PNG">
</p>

- Pilih GETH  Lalu Continue

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185341266-7d634ade-0716-4212-a5f3-726488c274be.PNG">
</p>

- Pilih LIGHTHOUSE Lalu Continue

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185341263-62ecba64-7d70-42f5-8de3-b0950ad82a6e.PNG">
</p>

- Isi Validator 1 Lalu Continue

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185341246-4ba342b2-a0a6-45db-90fe-0343b0b00ea4.PNG">
</p>

- Masukan Deposit Key Json kalian ke Upload Deposit Data, Drag and Drop
- Continue dan Verifikasi Approve Transaksi Metamask
- Maka Otomatis 32 ETH Yang ada di Wallet Kalian Tersedot

## Taruh 2 File Json Deposit dan Keystore kalian di Dalam Terminal Vps

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185343695-b4176fa0-b765-4b5d-9006-bb0a4623760f.PNG">
</p>

Pastikan Anda Berada di Dalam Sistem Root, jalan Perintah Untuk Membuat Folder Baru
```
mkdir keystores
```
- Masukan 2 Folder Kedalam Terminal, Ini Untuk Pengguna Mobaxterms Tinggal Drag n Drop
- Untuk Penggunakan Hp Bisa Membuat Manual
- Pakai Command `cd keystores`
- Lalu `nano namafile` paste isian dalemnya lalu Simpan `CTRL X + Y + ENTER`
- Masukan Keduanya Dengan nama File Yg Sama

## Mengonfigurasi klien validator Lighthouse Anda

```
sudo useradd --no-create-home --shell /bin/false lighthousevalidator
sudo mkdir -p /var/lib/lighthouse/validators
sudo chown -R lighthousevalidator:lighthousevalidator /var/lib/lighthouse/validators
sudo chmod 700 /var/lib/lighthouse/validators
```

```
sudo /usr/local/bin/lighthouse account validator import \
    --directory /root/keystores \
    --datadir /var/lib/lighthouse \
    --network ropsten
sudo chown -R lighthousevalidator:lighthousevalidator /var/lib/lighthouse/validators
```

- Masukan Password Yang Kalian Buat di Wagyu Tadi
- Akan Terlihat Seperti Gambar di Bawah Artinya Sukses

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185346054-7ecd6476-ceb7-4bd4-a1a8-7428955107c9.PNG">
</p>

Buat file konfigurasi layanan systemd untuk mengonfigurasi layanan klien validator Lighthouse.

```
sudo nano /etc/systemd/system/lighthousevalidator.service
```

Salin dan Masukan Perintah di Bawah Ubah `0x0000000000000000000000000000` dengan Address Metamask Yang Kalian Gunakan

```
[Unit]
Description=Lighthouse Ethereum Client Validator Client (Ropsten)
Wants=network-online.target
After=network-online.target

[Service]
User=lighthousevalidator
Group=lighthousevalidator
Type=simple
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/lighthouse vc \
    --network ropsten \
    --datadir /var/lib/lighthouse \
    --graffiti EthStaker \
    --metrics \
    --suggested-fee-recipient 0x0000000000000000000000000000000000000000

[Install]
WantedBy=multi-user.target
```
## Mulai Systemd

```
sudo systemctl daemon-reload
sudo systemctl start lighthousevalidator.service
sudo systemctl status lighthousevalidator.service
```

```
sudo systemctl enable lighthousevalidator.service
```

## Check Log

```
sudo journalctl -f -u lighthousevalidator.service -o cat | ccze -A
```

## Submit Validator Ke Situs Testnet

<p align="center">
  <img height="auto" height="auto" src="https://user-images.githubusercontent.com/38981255/185347632-f313adce-39fe-41ae-b972-08c6de288f80.PNG">
</p>

- Buka Link : https://testnet.safestake.xyz/
- Pilih Run Validator
- Import Existed
- Upload File Keystore kalian
- Next

# Pilih 4 Operator

- Kalian Harus Memilih 4 Validator, Jangan ParaStateDAO4 Harus Operator Orang Lain
- Kalian Bisa Add Operator ane Namanya `BangPateng`
- Lalu Kalian Bisa Lanjutkan dan Transaksi Approve Via Metamask