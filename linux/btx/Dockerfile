# Linux Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-unix.md
# Build with: screen docker build -t linux-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/entry linux-64bit

FROM dalijolijo/crypto-lib-ubuntu:14.04
MAINTAINER Dalijolijo
ENV VERSION "0.15.1.0"
ENV OUTPUT_DIR BitCore
ENV GUI_DOWNLOAD_URL https://github.com/LIMXTEC/BitCore/archive/${VERSION}.tar.gz

USER root
WORKDIR /usr/src
ENV ENTRY /usr/src/entry
ENV RESULT /usr/src/result

# Preparations
RUN mkdir ${ENTRY} && \
    mkdir ${RESULT}

# Download defined version and extract tarball
RUN curl ${GUI_DOWNLOAD_URL} -O && \
    tar zxf ${VERSION}.tar.gz -C ./${OUTPUT_DIR}

# Change 'make -j x' with your individual x CPU cores to use multi compilation
RUN cd && \
    cd ${OUTPUT_DIR} && \
    ./autogen.sh && \
    ./configure --disable-hardening --disable-tests LDFLAGS=-static-libstdc++ && \
    make -j 2 && \
    make install DESTDIR=${RESULT}

CMD ["/bin/bash"]
