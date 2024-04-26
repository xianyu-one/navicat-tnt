FROM alpine:3.15 AS builder

WORKDIR /work

COPY ./fmt-8.1.1.zip /work
COPY ./navicat-keygen-linux.zip /work
COPY ./openssl-3.0.12.tar.gz /work

RUN apk update && apk add \
    make \
    cmake \
    unzip \
    wget \
    curl \
    perl \
    gcc \
    g++ \
    python3 \
    git \
    upx \
    linux-headers \
    rapidjson-dev && \
    unzip fmt-8.1.1.zip && \
    cd fmt-8.1.1 && \
    mkdir build && cd build && \
    cmake .. && \
    export CPU_CORES=$(nproc) && \
    make -j $CPU_CORES && make install && \
    cd /work && \
    tar -xzvf openssl-3.0.12.tar.gz && \
    cd openssl-3.0.12/ && \
    ./Configure -static&& \
    make EXTRA_CFLAGS="-static" -j $CPU_CORES && make test -j $CPU_CORES && make install && \
    cd /work && \
    unzip navicat-keygen-linux.zip && \
    cd navicat-keygen-linux && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" .. && \
    make clean && make EXTRA_CFLAGS="-static" -j $CPU_CORES && \
    mkdir /work/release && cp navicat-keygen /work/release/ && cp navicat-patcher /work/release/

FROM alpine:3.15

COPY --from=builder /work/release/navicat-keygen /usr/bin/
COPY --from=builder /work/release/navicat-patcher /usr/bin/

RUN apk update && apk add \
    musl \
    libstdc++ \
    libgcc

WORKDIR /work