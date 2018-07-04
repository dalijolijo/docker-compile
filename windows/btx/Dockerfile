FROM ubuntu:18.10

USER root
WORKDIR /usr/src

# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t windows_btx-wallet_64bit .
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git sudo build-essential libtool autotools-dev automake pkg-config bsdmainutils curl && \
    apt-get install -y g++-mingw-w64-x86-64 mingw-w64-x86-64-dev

RUN git clone https://github.com/LIMXTEC/BitCore.git && \
    cd BitCore && \
    cd depends && \
    make HOST=x86_64-w64-mingw32 && \
    cd .. && \
    ./autogen.sh && \
    CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site && \
    ./configure --prefix=/ && \
    make

RUN mkdir ${WORKDIR}/result && \
    make install DESTDIR=${WORKDIR}/result

CMD ["/bin/bash"]
