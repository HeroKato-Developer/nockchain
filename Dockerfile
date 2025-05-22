FROM ubuntu:24.04

# install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt install clang llvm-dev libclang-dev curl iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar bsdmainutils ncdu unzip -y

# install rustup
WORKDIR /opt
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo --version

#! OK
# clone and build nockchain
RUN git clone https://github.com/zorp-corp/nockchain
WORKDIR /opt/nockchain
RUN cp .env_example .env

RUN make install-hoonc
RUN make build
RUN make install-nockchain-wallet
RUN make install-nockchain

# add startup script
COPY startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

# add balance script
COPY balance.sh /opt/balance.sh
RUN chmod +x /opt/balance.sh

ENTRYPOINT ["/opt/startup.sh"]