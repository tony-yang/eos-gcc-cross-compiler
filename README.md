# eos-gcc-cross-compiler
Building a gcc cross-platform compiler for the eOS.

Currently, it follows the barebone OS dev guide from the osdev.org. This builds a plain i686-elf cross compiler. This is a base container to be included in the eos dev environment to support the building of a new OS

## User Guide
Clone this repo and build the docker image
```
docker build -t eos-xcompiler .
```

# References
Download the binutils source code: https://mirrors.sorengard.com/gnu/binutils/binutils-2.30.tar.gz

Download the gcc source code: https://bigsearcher.com/mirrors/gcc/releases/gcc-5.5.0/gcc-5.5.0.tar.gz

The guide to build a GCC Cross Compiler: https://wiki.osdev.org/GCC_Cross-Compiler
