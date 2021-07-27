#!/usr/bin/env zsh
# udp / tcp 8443 8080 端口
apt-get install mercurial openssl libssl-dev golang ninja-build -y

gh repo clone Kitware/CMake

cd CMake
git checkout v3.21.0
./bootstrap
make -j$(nproc)
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

hg clone https://hg.nginx.org/nginx-quic
cd nginx-quic
hg update quic
# --with-http_v3_module     - enable QUIC and HTTP/3
# --with-http_quic_module   - enable QUIC for older HTTP versions
# --with-stream_quic_module - enable QUIC in Stream
./auto/configure --with-debug --with-http_v3_module --with-http_quic_module --with-stream_quic_module \
    --with-stream=dynamic --with-http_addition_module --with-http_mp4_module \
    --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log \
    --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid \
    --with-cc-opt="-I../boringssl/include" \
    --with-ld-opt="-L../boringssl/build/ssl -L../boringssl/build/crypto"
make -j$(nproc)
sudo make install

# 测试页面
# https://http3check.net/
