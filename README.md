# how to install and run
clone the repo and execute install-docker.sh to install docker engine into ubuntu

    sudo ./install-docker.sh

once installed modify the file compose.yaml
adding your wallet b58 address and your chaincode (you should have saved them once created your nockchain wallet)
you will see these two things to change inside the file

    environment:
        - WALLET=insert_here_wallet_base58
        - CHAIN_CODE=insert_here_your_chain_code

once modified the file to start the containers use this command

    docker compose up --scale nockchain=6 -d

^ this will create 6 miners

# wallet balance
in case you want to check your wallet balance you have to enter a docker container, to do so execute

    docker exec -it nameofyourcontainer /bin/sh

once inside execute this command to start the wallet request for balance

    nockchain-wallet --nockchain-socket .socket/nockchain_npc.sock update-balance
