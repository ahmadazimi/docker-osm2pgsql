# DOCKER-VERSION 24.0.7
# VERSION 1.0

FROM debian:bookworm

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    make \
    cmake \
    g++ \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libexpat1-dev \
    zlib1g-dev \
    libpotrace-dev \
    libopencv-dev \
    libbz2-dev \
    libpq-dev \
    libproj-dev \
    lua5.4 \
    liblua5.4-dev \
    libluajit-5.1-dev \
    pandoc \
    nlohmann-json3-dev \
    pyosmium &&\
    rm -rf /var/lib/apt/lists/*

ENV HOME /root
ENV OSM2PGSQL_VERSION 1.9.2

RUN mkdir src &&\
    cd src &&\
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/osm2pgsql-dev/osm2pgsql.git &&\
    cd osm2pgsql &&\
    mkdir build &&\
    cd build &&\
    cmake -D WITH_LUAJIT=ON .. &&\
    make &&\
    make man &&\
    make install &&\
    cd /root &&\
    rm -rf src

ENTRYPOINT ["/bin/bash"]