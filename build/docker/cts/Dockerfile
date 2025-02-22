# syntax = docker/dockerfile:1.0-experimental
FROM centos:centos6 as build
MAINTAINER Tutu Ajayi "ajayi@umich.edu"

# install gcc 6
RUN yum -y install centos-release-scl && \
    yum -y install devtoolset-6 devtoolset-6-libatomic-devel
ENV CC=/opt/rh/devtoolset-6/root/usr/bin/gcc \
    CPP=/opt/rh/devtoolset-6/root/usr/bin/cpp \
    CXX=/opt/rh/devtoolset-6/root/usr/bin/g++ \
    PATH=/opt/rh/devtoolset-6/root/usr/bin:$PATH \
    LD_LIBRARY_PATH=/opt/rh/devtoolset-6/root/usr/lib64:/opt/rh/devtoolset-6/root/usr/lib:/opt/rh/devtoolset-6/root/usr/lib64/dyninst:/opt/rh/devtoolset-6/root/usr/lib/dyninst:/opt/rh/devtoolset-6/root/usr/lib64:/opt/rh/devtoolset-6/root/usr/lib:$LD_LIBRARY_PATH

RUN yum install -y wget git ghostscript glpk-devel bison bison-devel zlib-devel

# Installing newer version of cmake
RUN wget https://cmake.org/files/v3.9/cmake-3.9.0-Linux-x86_64.sh && \
    chmod +x cmake-3.9.0-Linux-x86_64.sh  && \
    ./cmake-3.9.0-Linux-x86_64.sh --skip-license --prefix=/usr/local

# Installing lemon
RUN wget http://lemon.cs.elte.hu/pub/sources/lemon-1.3.1.tar.gz && \
    tar -xf lemon-1.3.1.tar.gz

RUN mkdir lemon-1.3.1/build  && \
    cd lemon-1.3.1/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/lemon_build .. && \
    make && \
    make install

RUN git clone https://github.com/The-OpenROAD-Project/TritonCTS.git

WORKDIR "TritonCTS"
RUN ./compileAll.sh /lemon_build $(nproc)

RUN mkdir -p /build/TritonCTS/bin && \
    cp bin/genHtree /build/TritonCTS/bin && \
    cp third_party/lefdef2cts /build/TritonCTS/bin && \
    cp -pr src/scripts /build/TritonCTS && \
    cp -pr src/tech /build/TritonCTS && \
    cp -pr runTritonCTS.tcl /build/TritonCTS

# Piggy backing on cts
WORKDIR /
RUN git clone https://github.com/cmatsuoka/figlet.git
RUN cd figlet && \
    make

RUN mkdir -p /build/figlet && \
    mkdir -p /build/bin && \
    cp /figlet/figlet /build/bin && \
    cp -pr /figlet/fonts /build/figlet

WORKDIR "/TritonCTS"

RUN date +"Build Timestamp: %Y-%m-%d_%H-%M-%S" > /build/cts.version
RUN git rev-parse HEAD >> /build/cts.version
RUN tar -czf /build.tar.gz /build

