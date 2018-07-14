FROM ubuntu:16.04

USER root
WORKDIR /usr/src

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y  apt-utils \
                        autoconf \
                        automake \
                        autotools-dev \
                        build-essential \
                        bsdmainutils \
                        curl \
                        git \
                        libboost-all-dev \
                        libevent-dev \
                        libminiupnpc-dev \
                        libssl-dev \
                        libtool \
                        libzmq5-dev \
                        pkg-config \
                        software-properties-common \
                        sudo \
                        supervisor \
                        vim \
                        wget
                        
RUN apt-get install -y libprotobuf-dev \
                       libqrencode-dev \
                       libqt5core5a \
                       libqt5dbus5 \
                       libqt5gui5 \
                       protobuf-compiler \
                       qttools5-dev \
                       qttools5-dev-tools

RUN sudo add-apt-repository -y ppa:bitcoin/bitcoin
RUN sudo apt-get update && \ 
    sudo apt-get -y upgrade
RUN apt-get install -y libdb4.8-dev \
                        libdb4.8++-dev

CMD ["/bin/bash"]
