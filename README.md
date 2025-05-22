clone the repo and execute install-docker.sh to install docker engine into ubuntu

sudo ./install-docker.sh

once installed you can start the container using this command to start it,
replace 3Emudaonatdb6hCxvvXvHKFJ8We6Mvd7EMucxfaQUEhEcyS7RMt8y9pKgLe4vvMK3hyt9WV8SZhGggYEfGzRRdg9MTGmKNZQLZdyq1zzsKgTh2CFg6qnR8khv5odzGBgMVMb with your own wallet address

docker run --name=nockchain -itd -p 3005:3005 -p 3006:3006 herokatodev/nockchain:latest 3Emudaonatdb6hCxvvXvHKFJ8We6Mvd7EMucxfaQUEhEcyS7RMt8y9pKgLe4vvMK3hyt9WV8SZhGggYEfGzRRdg9MTGmKNZQLZdyq1zzsKgTh2CFg6qnR8khv5odzGBgMVMb

i'm pretty unsure if nockchain needs redirects on those ports 3005, 3006, because at the time i'm writing this this is the point we reached
![image](https://github.com/user-attachments/assets/0f415a8b-fc98-43c9-94a9-f26544834c57)

but nobody confirmed with us that is properly working...
