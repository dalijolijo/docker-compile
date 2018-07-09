# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t win-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/ win-64bit

FROM dalijolijo/crypto-lib-windows:8.1
MAINTAINER Dalijolijo
ENV VERSION "0.15.1.0"
ENV OUTPUT_DIR BitCore
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
# (?) make OS=windows ARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc
RUN cd ${SRC} && \
    cd ${OUTPUT_DIR}-${VERSION} && \
    cd depends && \
    make HOST=x86_64-w64-mingw32 make OS=windows ARCH=x86_64 CGO_ENABLED=1 CXX_FOR_TARGET=x86_64-w64-mingw32-g++ CC_FOR_TARGET=x86_64-w64-mingw32-gcc && \
    cd .. && \
    CONFIG_SITE=$PWD/depends/x86_64-pc-linux-gnu/share/config.site ./configure --disable-hardening --disable-tests --prefix=/ && \
    make -j 2 && \
    make install DESTDIR=${RESULT}

# strip files and create a tarball
RUN cd ${RESULT}/usr/local && \
    strip ./bin/* && \
    strip ./lib/*.a && \
    strip ./lib/*.so* && \
    cd ${RESULT}/usr/ && \
    mv local ${OUTPUT_DIR}-${VERSION} && \
    tar -czvf ${OUTPUT_DIR}-${VERSION}.tar.gz ${OUTPUT_DIR}-${VERSION} && \
    cp ${OUTPUT_DIR}-${VERSION}.tar.gz ${WORKDIR}

CMD ["/bin/bash"]
