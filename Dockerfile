FROM ubuntu

#From https://gerpei.de/eigener-live-streaming-server-setup/
# without downscaling for mobile and recording

RUN apt-get update && \
    apt-get -y install build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev unzip wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget http://nginx.org/download/nginx-1.15.1.tar.gz && \
    wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/dev.zip

RUN tar -zxvf nginx-1.15.1.tar.gz && \
    unzip dev.zip && \
    cd nginx-1.15.1 && \
    ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-dev && \
    make && \
    make install && \
    cd .. && \
    rm -r nginx-1.15.1 nginx-1.15.1.tar.gz dev.zip nginx-rtmp-module-dev

COPY nginx.conf /usr/local/nginx/conf/nginx.conf

RUN mkdir /HLS
EXPOSE 8080
EXPOSE 1935

STOPSIGNAL SIGTERM
CMD [ "/usr/local/nginx/sbin/nginx", "-g", "daemon off;" ]
#http://stream2.er1807.de//live/test/index.m3u8