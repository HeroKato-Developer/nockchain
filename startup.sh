#!/bin/bash
# retrieve args of launch 
wallet_address="${1:-$WALLET}"
echo "Wallet address: $wallet_address"

# replace mining key
sed -i "s|^export MINING_PUBKEY := .*|export MINING_PUBKEY := $wallet_address|" /opt/nockchain/Makefile
sed -i "s|^export MINING_PUBKEY=.*|export MINING_PUBKEY=$wallet_address|" /opt/nockchain/.env

cat /opt/nockchain/.env

# start
# make run-nockchain
nockchain --mining-pubkey $wallet_address --mine