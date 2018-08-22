#! /bin/bash
cd /root && git clone https://github.com/bagder/libbrotli
cd libbrotli
./autogen.sh
./configure
make && make install
ln -s /usr/local/lib/libbrotlienc.so.1 /lib64
cd /root && git clone https://github.com/google/ngx_brotli
cd /root/ngx_brotli && git submodule update --init