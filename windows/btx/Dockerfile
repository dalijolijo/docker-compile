# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t win-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/ win-64bit

FROM dalijolijo/crypto-lib-windows:8.1

USER root
WORKDIR /usr/src

RUN git clone https://github.com/LIMXTEC/BitCore.git && \
    cd BitCore && \
    cd depends && \
    make OS=windows ARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc && \
    cd .. && \
    ./autogen.sh && \
    CONFIG_SITE=$PWD/depends/x86_64-pc-linux-gnu/share/config.site ./configure --prefix=/ && \
    make && \
    mkdir /result && \
    make install DESTDIR=/result

CMD ["/bin/bash"]
