# eOS GCC Cross-Platform Compiler
#
# VERSION 0.1

FROM ubuntu
RUN apt-get update && apt-get install -y \
    bison \
    build-essential \
    flex \
    libcloog-isl-dev \
    libgmp3-dev \
    libisl-dev \
    libmpc-dev \
    libmpfr-dev \
    python3 \
    python3-pip \
    texinfo \
    wget \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ENV HOME="/root" \
    PREFIX="/root/opt/cross" \
    TARGET=i686-elf \
    PATH="/root/opt/cross/bin:$PATH" \
    SRC="/root/src"

RUN mkdir -p ${SRC} \
 && mkdir -p ${PREFIX} \
 && cd ${SRC} \
 && wget https://mirrors.sorengard.com/gnu/binutils/binutils-2.30.tar.gz \
 && tar -zxf ${SRC}/binutils-2.30.tar.gz \
 && mkdir build-binutils \
 && cd build-binutils \
 && ../binutils-2.30/configure --target=${TARGET} --prefix="${PREFIX}" --with-sysroot --disable-nls --disable-werror \
 && make \
 && make install \
 && make clean \
 && cd ${SRC} \
 && rm -rf binutils-2.30.tar.gz binutils-2.30

RUN cd ${SRC} \
 && wget https://bigsearcher.com/mirrors/gcc/releases/gcc-5.5.0/gcc-5.5.0.tar.gz \
 && tar -zxf ${SRC}/gcc-5.5.0.tar.gz \
 && mkdir build-gcc \
 && cd build-gcc \
 && ../gcc-5.5.0/configure --target=${TARGET} --prefix="${PREFIX}" --disable-nls --enable-languages=c,c++ --without-headers \
 && make all-gcc \
 && make all-target-libgcc \
 && make install-gcc \
 && make install-target-libgcc \
 && make clean \
 && cd ${SRC} \
 && rm -rf gcc-5.5.0.tar.gz gcc-5.5.0
