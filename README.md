# RTMP-HLS-Docker

endpoints are located at /live/streamkey for RTMP and /live/streamkey/index.m3u8 for HLS
  
Current delay is under 10 seconds. Make sure your keyframe interval is 1 seconds.

This docker container has no security for who is allowed to stream. Make sure to restric the access.
  
## Ports
+ 1935 for RTMP
+ 8080 for HLS/HTTP
## Build
docker build -t hlss .
## Run
docker run -d --name hlss -p 1935:1935 -p 8080:8080 hlss:latest
