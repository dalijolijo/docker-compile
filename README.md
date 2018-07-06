Docker images with pre-installed needed Libs for Linux Ubuntu and Windows to reduce compilation time.

## Linux

### Docker Image with pre-installed needed Libs for Linux

Find docker image here: https://hub.docker.com/r/dalijolijo/crypto-lib-ubuntu/

### Linux Comilation for Bitcore (BTX)

#### Start container
```
docker run --rm -td -v "$PWD":/usr/src/ dalijolijo/btx-wallet-linux64
```


## Windows

### Image with pre-installed needed Libs for Windows Cross-Compilation

Find docker image here: https://hub.docker.com/r/dalijolijo/crypto-lib-windows/

### Windows Comilation for Bitcore (BTX)

#### Start container
```
docker run --rm -td -v "$PWD":/usr/src/ dalijolijo/btx-wallet-windows64
```

## Find compilation result data

Jump in the docker container with:
```
docker ps
docker exec -ti <docker-container-name> bash
```
Find compilation files under `/result` and copy needed files to `/usr/src` to make it available outside the docker container.
