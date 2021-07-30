FROM python:slim-buster as builder

# install dependencies
RUN apt update && apt upgrade -y && apt install -y \
    git \
    build-essential \
    cmake

# clone box86 git repo
RUN git clone https://github.com/ptitSeb/box86 && mkdir /box86/build

# compile box86
WORKDIR /box86/build
RUN cmake .. -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo
RUN make -j$(nproc)

# **********************************************************
# prep container for to install box86
FROM debian:buster-slim as runner

# install dependencies
RUN apt update && apt upgrade -y && apt install -y make cmake

# copy box86 build and install in container
COPY --from=builder /box86 /box86
WORKDIR /box86/build
RUN make install

