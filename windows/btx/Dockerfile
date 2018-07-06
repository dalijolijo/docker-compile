# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t win-64bit .
# Run the docker container with docker run --rm -it -v "$PWD":/usr/src/ win-64bit bash

FROM dalijolijo/crypto-lib-windows:8.1

USER root
WORKDIR /usr/src

RUN git clone https://github.com/LIMXTEC/BitCore.git && \
    cd BitCore && \
    cd depends && \
    make GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc && \
    cd .. && \
    ./autogen.sh

RUN CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site ./configure --prefix=/ && \
    make && \
    mkdir /usr/src/result && \
    make install DESTDIR=/usr/src/result

COPY start.sh /usr/local/bin/start.sh
RUN rm -f /var/log/access.log && mkfifo -m 0666 /var/log/access.log && \
    chmod 755 /usr/local/bin/*

ENV TERM linux
CMD ["/usr/local/bin/start.sh"]
