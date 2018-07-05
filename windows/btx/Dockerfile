FROM gcc:8.1

USER root
WORKDIR /usr/src

# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t win-64bit .
# Run the docker container with docker run --rm -v "$PWD":/usr/src/ win-64bit
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git sudo build-essential libtool autotools-dev automake pkg-config bsdmainutils curl && \
    apt-get install -y g++-mingw-w64-x86-64 mingw-w64-x86-64-dev gcc-mingw-w64 gcc-multilib

# description => failed
# make HOST=x86_64-w64-mingw32 && \

# alternatives
# make GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc

# failed
#  make GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++

COPY . /usr/src

RUN cd BitCore && \
    cd depends && \
    make GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc && \
    cd .. && \
    ./autogen.sh

RUN CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site ./configure --prefix=/ && \
    make && \
    mkdir ${WORKDIR}/result && \
    make install DESTDIR=${WORKDIR}/result

CMD ["/bin/bash"]
