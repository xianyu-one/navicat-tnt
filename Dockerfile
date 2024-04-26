FROM alpine:3 AS builder

WORKDIR /work

COPY ./fmt-8.1.1.zip /work

RUN apk update && apk add \
    make \
    cmake \
    unzip \
    wget \
    curl \
    git \
    gcc \
    g++ \
    python3 \
    rapidjson \
    libressl-dev &&\
    unzip fmt-8.1.1.zip && \
    cd fmt-8.1.1 && \\
    mkdir build && cd build && \
    cmake .. && \
    make -j8 && make install && \
    cd /work && \
    git clone -b linux --single-branch https://gitlab.our-family.net/yinglezhi/navicat-keygen.git && \
    cd navicat-keygen && \
    mkdir build && cd build && \

