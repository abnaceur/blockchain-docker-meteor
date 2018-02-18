TCM_Private-blockchain_dev
=========================

## Install gdd development environment

Get the source:

```bash
git clone git@git.thecodingmachine.com:tcm-projects/gdd.git
```

Edit your `/etc/hosts` file:

```
127.0.0.1   127.0.0.1 dapp.TCM.dev
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
# Start meteor on port 3000.
docker exec -d TCM_dapp  sh -c "cd /var/www/html && sudo meteor --unsafe-perm"
```

```bash
# Now initiate the genesis file 
docker exec -d TCM_dapp  sh -c "cd /var/www/html && geth –datadir=./chaindata init /etherum-genesis/genesis.json"
```

Default account to access the application as an Admin
```bash
Email: admin@gdd.com 
Password: @admingdd
```


Default account to access the application as a Collaborator
```bash
Email: collab@gdd.com 
Password: @admingdd
```

### Connect to the database

Start this link in your browser: 
P.S: Get sure that all your containers are up "docker ps".

```bash
Usernaem: root 
Password: root
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
