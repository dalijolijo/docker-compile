# Windows Cross-Comilation Libs Installation
FROM gcc:8.1

USER root
WORKDIR /usr/src

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y bash git sudo build-essential libtool autotools-dev automake pkg-config bsdmainutils curl && \
    apt-get install -y g++-mingw-w64-x86-64 mingw-w64-x86-64-dev gcc-mingw-w64 gcc-multilib

CMD ["/bin/bash"]
