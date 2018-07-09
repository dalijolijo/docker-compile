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
docker run --rm --name btx-wallet -td -v "$PWD":/usr/src/entry dalijolijo/btx-wallet-windows64
```

## Find compilation result data

Jump in the docker container with:
```
docker exec -ti btx-wallet bash
```
Find compilation files under `/usr/src/` and do the last steps to make it available outside (copy to directory `/usr/src/entry`) the docker container. 

#### Example:
Jump into BTX docker container
```
docker exec -ti btx-wallet bash
```
Copy tarball to the outside available directory
```
mv BitCore-0.15.1.0.tar.gz entry/
exit
```

