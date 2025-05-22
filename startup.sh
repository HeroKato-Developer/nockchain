#!/bin/bash
# retrieve args of launch 
wallet_address="${1:-$WALLET}"
chain_code="${2:-$CHAIN_CODE}"
echo "Wallet address: $wallet_address"
echo "Chain code: $chain_code"

cd /opt/nockchain
chmod 777 .env
chmod 777 Makefile

# replace mining key
sed -i "s|^export MINING_PUBKEY := .*|export MINING_PUBKEY := $wallet_address|" /opt/nockchain/Makefile
sed -i "s|^MINING_PUBKEY=.*|MINING_PUBKEY=$wallet_address|" /opt/nockchain/.env

rm -rf .data.nockchain

# import wallet
nockchain-wallet import-master-pubkey --key $wallet_address --chain-code $chain_code

# start
# make run-nockchain
nockchain --mining-pubkey $wallet_address --mine --peer /ip4/95.216.102.60/udp/3006/quic-v1 --peer /ip4/65.108.123.225/udp/3006/quic-v1 --peer /ip4/65.109.156.108/udp/3006/quic-v1 --peer /ip4/65.21.67.175/udp/3006/quic-v1 --peer /ip4/65.109.156.172/udp/3006/quic-v1 --peer /ip4/34.174.22.166/udp/3006/quic-v1 --peer /ip4/34.95.155.151/udp/30000/quic-v1 --peer /ip4/34.18.98.38/udp/30000/quic-v1