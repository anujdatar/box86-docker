FROM python:slim-buster as builder
ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git build-essential cmake

# clone box86 git repo
RUN git clone https://github.com/ptitSeb/box86 && mkdir /box86/build

# compile box86
WORKDIR /box86/build
RUN cmake .. -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo
RUN make -j$(nproc)

# *********************************************************************
# container to install box86 in
FROM debian:buster-slim

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make cmake

# copy box86 build from above and install in container
COPY --from=builder /box86 /box86
WORKDIR /box86/build
RUN make install

