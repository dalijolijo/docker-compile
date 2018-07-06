FROM dalijolijo/crypto-lib-ubuntu:14.04

USER root
WORKDIR /usr/src

# Linux Ubuntu/Debian Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-unix.md
# Build with: screen docker build -t linux-64bit .
# Run the docker container with docker run --rm -v "$PWD":/usr/src/ linux-64bit

#
# Cloning and Compiling BitCore Wallet
#
RUN echo '*** Cloning and Compiling BitCore Wallet ***' && \
    cd && \
    echo "Execute a git clone of LIMXTEC/BitCore. Please wait..." && \
    git clone https://github.com/LIMXTEC/BitCore.git && \
    cd BitCore && \
    ./autogen.sh && \
    ./configure --disable-hardening --disable-tests LDFLAGS=-static-libstdc++ && \
    make -j 8 && \
    mkdir ${WORKDIR}/result && \
    make install DESTDIR=${WORKDIR}/result


# For RPC Server only?
#RUN cd && \
#    cd BitCore/src && \
#    strip bitcored && \
#    cp bitcored /usr/local/bin && \
#    strip bitcore-cli && \
#    cp bitcore-cli /usr/local/bin && \
#    chmod 775 /usr/local/bin/bitcore* && \
#    cd && \
#    rm -rf BitCore


CMD ["/bin/bash"]
