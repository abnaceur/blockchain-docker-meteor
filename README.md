TCM_Private-blockchain_dev
=========================

## Install gdd development environment

Get the source:

```bash
git clone git@git.thecodingmachine.com:tcm-projects/gdd.git
```

Edit your `/etc/hosts` file:

```
127.0.0.1   dapp.dev.local
```

Build the environment:


```bash
# copy the .env file.
cp .env-example .env
```


```bash
# Use your GITLAB credentials to login in the Docker private registry for the project.
docker-compose up --build
```
Note: the port 80 must not be used by another application (like Apache or Skype).

P.S: The build may take some time don't worry be happy and grab a cup of tea :)


```bash
# Start meteor on port 80.
docker exec -d dev_dapp  sh -c "cd /var/www/html && sudo meteor --unsafe-perm --port 80"
```

```bash
# Now attach geth to the private network 
docker exec -ti dev_dapp  sh -c "cd /var/www/html && geth -datadir=chaindata/ attach"
```

```bash
# Start the mist wallet 
sudo ./linux-unpacked/mist --rpc chaindata/geth.ipc
```


### Help

Stop and remove all containers

```bash
docker stop $(docker ps -a -q)
```

Connect to a container via bash (get the container name you want to connect to via command `docker ps`)
```bash
docker exec -ti containername bash
```

Execute a command directly in a container without connecting in bash (get the container name you want to connect to via command `docker ps`)

```bash
docker exec -i containername yourcommand
```

Delete all inages 

```bash
docker rmi -f $(docker images -q)
```

Show inages 
```bash
docker images
```


#### Genesis block

```bash
Ex: {
   "config": {
        "chainId": 15,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
  "nonce": "0x0000000000000042",
  "difficulty": "0x000002",
  "mixhash": "0x00000000000000000000000000000000000000647572616c65787365646c6578",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "timestamp": "0x00",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "extraData": "0x",
  "gasLimit": "0x4c4b40",
  "alloc": {
    "cd2a3d9f938e13cd947ec05abc7fe734df8dd826": { "balance": "10000000000000000" }
  }
}
```

####2. Make the chain data with the initialized genesis block 

```
geth –datadir=./chaindata init genesis.json
```
####3. start meteor from the file.
#####3.1 - See this to install Meteor - https://www.meteor.com/install
#####3.2 - Create a new Meteor project
```
meteor create new-project
```
######P.S : for more tips how to create projects in Meteor : http://meteortips.com/first-meteor-tutorial/projects/
######3.0 - Install geth - https://github.com/ethereum/go-ethereum/wiki/Installation-instructions-for-Windows
####3.1 Start the RPCtest [for local blockchain] listener 
```
geth --datadir=./chaindata --rpc --rpccorsdomain "http://localhost:3000"
```
##### - Leave this terminal open
####4. Start the mist wallet as an admin.
####4.1 - The mist Wallet will connect to the local Blockchain
####5. in another terminal attach geth to interact with the local blockchain: 

```
geth attach
```

####Create a new account and set it to be a mining

```
Personal.newAccount(“pass1345”);
miner.setEtherbase(personal.listAccounts[0])
miner.start(2);
```

####After mining, some ether will show up in your account
####Stop mining

```
Miner.stop();
```

#### Start RPC connexion
```bash
admin.startRPC("go-ethereum", 8545, "*", "web3,net,eth") // Active l'API
```


#### Start geth
```bash
geth --rpc --rpccorsdomain "*" --rpcaddr "0.0.0.0" --rpcport "8545" --rpcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3"  --networkid 184  --nat "any" --dev
```

#### Test connexion from your local machine
```
curl -X POST -H "Content-Type: application/json" --data-binary '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' http://127.0.0.1:8545
curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["eth key", "latest"],"id":1}' http://127.0.0.1:8545
```
#### In your geth consol list accounts
```
eth.accounts
```

#### Check the balance of a specific key
```
web3.fromWei(eth.getBalance("eth key"), "ether")
```

#### Transactions
```
personal.unlockAccount("eth key", "mypasswd", 30) // unlock the account for 30 seconds
eth.sendTransaction({from: 'eth key', to: 'eth key receiver', value: web3.toWei(1, "ether")}) // Send 1 ether to "eth key receiver"
```
#### Activate the RPC api
```
admin.startRPC("go-ethereum", 8545, "*", "web3,net,eth") // Active l'API
 ```
#### Check connexion with all nodes
```
net.listening
net.peerCount
```

#### Check the Nodes stat
```
eth
```

#### Check the syncronization mode
```
eth.syncing
```