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

## Find compilation results

Jump in the docker container with:
```
docker run --rm -ti -v "$PWD":/usr/src/ <docker-container> bash
```
Find compilation files under `/result` and copy needed files to `/usr/src` to make it available outside the docker container.
