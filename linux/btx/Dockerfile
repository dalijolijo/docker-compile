# Linux Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-unix.md
# Build with: screen docker build -t linux-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/ linux-64bit

FROM dalijolijo/crypto-lib-ubuntu:14.04

USER root
WORKDIR /usr/src

# Change 'make -j x' with your individual x CPU cores to use multi compilation
RUN cd && \
    git clone https://github.com/LIMXTEC/BitCore.git && \
    cd BitCore && \
    ./autogen.sh && \
    ./configure --disable-hardening --disable-tests LDFLAGS=-static-libstdc++ && \
    make -j 2 && \
    mkdir /result && \
    make install DESTDIR=/result

CMD ["/bin/bash"]
