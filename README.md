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
