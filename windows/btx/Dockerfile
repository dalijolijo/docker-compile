# Windows Cross-Comilation for Bitcore (BTX)
# https://github.com/LIMXTEC/BitCore/blob/0.15/doc/build-windows.md
# Build with: screen docker build -t win-64bit .
# Run the docker container with docker run --rm -td -v "$PWD":/usr/src/ win-64bit

FROM dalijolijo/crypto-lib-windows:8.1 #Debian 9
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
# './autogen.sh' not required when building from tarball
# (?) make OS=windows ARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc
RUN cd && \
    cd ${OUTPUT_DIR} && \
    cd depends && \
    make HOST=x86_64-w64-mingw32 && \
    cd .. && \
    CONFIG_SITE=$PWD/depends/x86_64-pc-linux-gnu/share/config.site ./configure --disable-hardening --disable-tests --prefix=/ && \
    make -j 2 && \
    make install DESTDIR=${RESULT}

CMD ["/bin/bash"]
