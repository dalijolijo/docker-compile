# Linux Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-unix.md
# Build with: screen docker build -t linux-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/entry linux-64bit

FROM dalijolijo/crypto-lib-ubuntu:14.04
MAINTAINER Dalijolijo
ENV VERSION "0.15.1.0"
ENV OUTPUT_DIR "BitCore"
ENV DOWNLOAD_URL https://github.com/LIMXTEC/BitCore/archive/${VERSION}.tar.gz

USER root
WORKDIR /usr/src
ENV WORKDIR /usr/src
ENV SRC /usr/src/src
ENV ENTRY /usr/src/entry
ENV RESULT /usr/src/result

# Change sh to bash
SHELL ["/bin/bash", "-c"]

# Preparations
RUN mkdir ${ENTRY} && \
    mkdir ${SRC} && \
    mkdir ${RESULT}

# Download defined version and extract tarball
RUN cd ${SRC} && \
    wget ${DOWNLOAD_URL} && \
    tar zxf ${VERSION}.tar.gz

# Change 'make -j x' with your individual x CPU cores to use multi compilation
# './autogen.sh' not required when building from tarball
RUN cd ${SRC} && \
    cd ${OUTPUT_DIR}-${VERSION} && \
    ./autogen.sh && \
    ./configure --disable-hardening --disable-tests --with-libs LDFLAGS=-static-libstdc++ && \
    make SHARED=0 CC='gcc -static' -j 2 && \
    make install DESTDIR=${RESULT}

# Strip files and create a tarball
RUN cd ${RESULT}/usr/local && \
    strip ./bin/* && \
    strip ./lib/*.a && \
    strip ./lib/*.so* && \
    cd ${RESULT}/usr/ && \
    mv local ${OUTPUT_DIR}-${VERSION} && \
    tar -czvf ${OUTPUT_DIR}-${VERSION}.tar.gz ${OUTPUT_DIR}-${VERSION} && \
    cp ${OUTPUT_DIR}-${VERSION}.tar.gz ${WORKDIR}

CMD ["/bin/bash"]
