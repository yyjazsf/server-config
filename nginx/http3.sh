#!/usr/bin/env zsh
# udp / tcp 8443 8080 端口
apt-get install mercurial openssl libssl-dev go ninja-build -y

gh repo clone Kitware/CMake

cd CMake
git checkout v3.21.0
./bootstrap
make
sudo make install
cmake --version

# boringssl
git clone https://boringssl.googlesource.com/boringssl

cd boringssl

mkdir build
cd build
cmake -GNinja ..
ninja

# https://quic.nginx.org/
# https://hg.nginx.org/nginx-quic
# https://quic.nginx.org/readme.html

hg clone -b quic https://hg.nginx.org/nginx-quic
hg update quic
cd nginx-quic
# --with-http_v3_module     - enable QUIC and HTTP/3
# --with-http_quic_module   - enable QUIC for older HTTP versions
# --with-stream_quic_module - enable QUIC in Stream
./auto/configure --with-debug --with-http_v3_module --with-http_quic_module --with-stream_quic_module \
                       --with-cc-opt="-I../boringssl/include" \
                       --with-ld-opt="-L../boringssl/build/ssl -L../boringssl/build/crypto"
make

# 测试页面
# https://http3check.net/
