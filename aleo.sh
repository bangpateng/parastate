#!/bin/bash
clear
echo "==================================================================="
echo -e "\e[92m"
echo  "   ____          ____       _                    ";
echo  "  | __ )  __ _  |  _ \ __ _| |_ ___ _ __   __ _  ";
echo  "  |  _ \ / _' | | |_) / _' | __/ _ \ '_ \ / _' | ";
echo  "  | |_) | (_| | |  __/ (_| | ||  __/ | | | (_| | ";
echo  "  |____/ \__, | |_|   \__,_|\__\___|_| |_|\__, | ";
echo  "         |___/                            |___/  ";
echo -e "\e[0m"
echo "===================================================================" 

echo -e '\e[36mAuthor :\e[39m' Bang Pateng
echo -e '\e[36mTelegram Group :\e[39m' @bangpateng_group
echo -e '\e[36mTelegram Channel :\e[39m' @bangpateng_airdrop
echo -e '\e[36mYoutube :\e[39m' Bang Pateng
echo -e '\e[36mWebsite :\e[39m' www.bangpatengnode.site
echo "======================================="

sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y
sudo apt install git

echo -e "\e[1m\e[32m2. Installing Rupstup... \e[0m" && sleep 1
# packages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

echo -e "\e[1m\e[32m3. Clone Repository... \e[0m" && sleep 1
# download binary
git clone https://github.com/AleoHQ/snarkOS.git --depth 1 && cd snarkOS

echo -e "\e[1m\e[32m4. Build... \e[0m" && sleep 1
./build_ubuntu.sh

echo -e "\e[1m\e[32m5. Jalankan Node Klien Aleo... \e[0m" && sleep 1
./run-client.sh

echo -e "\e[1m\e[32m6. Buat Wallet... \e[0m" && sleep 1
cargo run --release -- experimental new_account

echo -e "\e[1m\e[32m7. Jalankan Aleo Prover Node... \e[0m" && sleep 1
./run-prover.sh

echo '=============== SETUP FINISHED ==================='
echo -e 'To Salin Data Pharse Kalian: \e[1m\e[32msudo journalctl -u evmosd -f -o cat\e[0m'
echo -e "To check sync status: \e[1m\e[32mevmosd status 2>&1 | jq .SyncInfo\e[0m" && sleep 1
