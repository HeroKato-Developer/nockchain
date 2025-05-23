#!/bin/bash
# retrieve args of launch 
wallet_address="${1:-$WALLET}"
chain_code="${2:-$CHAIN_CODE}"
peers_list="${3:-$PEERS_LIST}"
rust_logs="${4:-$LOGS}"

echo "Wallet address: $wallet_address"
echo "Chain code: $chain_code"
echo "Peers list: $peers_list"
echo "Rust logs: $rust_logs"

peer_args=""
IFS=';' read -ra ADDR <<< "$peers_list"
for ip in "${ADDR[@]}"; do
  peer_args+=" --peer /ip4/${ip}/udp/3006/quic-v1"
done
echo "Peer args: $peer_args"

cd /opt/nockchain
chmod 777 .env
chmod 777 Makefile

# replace mining key
sed -i "s|^MINING_PUBKEY=.*|MINING_PUBKEY=$wallet_address|" /opt/nockchain/.env
sed -i "s|^RUST_LOG=.*|RUST_LOG=$rust_logs|" /opt/nockchain/.env

rm -rf .data.nockchain

# import wallet
nockchain-wallet import-master-pubkey --key $wallet_address --chain-code $chain_code

# start
nockchain --mining-pubkey $wallet_address --mine $peer_args

exit_code=$?
echo "nockchain exited with code $exit_code, sleeping 60 seconds before exit..."
sleep 60
exit $exit_code