#! /bin/bash
cd /root && wget https://www.openssl.org/source/openssl-1.1.0c.tar.gz
tar -zxf openssl-1.1.0c.tar.gz
cd openssl-1.1.0c
./config && make && make install
mv /usr/bin/openssl /usr/bin/openssl.bak
mv /usr/include/openssl /usr/include/openssl.bak
ln -s /usr/local/bin/openssl /usr/bin/openssl
ln -s /usr/local/include/openssl /usr/include/openssl
ln -s /usr/local/lib64/libssl.so.1.1 /usr/lib64/libssl.so.1.1
ln -s /usr/local/lib64/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1