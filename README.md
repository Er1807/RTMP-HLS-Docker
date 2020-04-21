# RTMP-HLS-Docker
endpoints are located at /live/<streamkey> for RTMP and /live/<streamkey>/index.m3u8 for HLS
## Ports
+ 1935 for RTMP
+ 8080 for HLS/HTTP

Current delay is under 10 seconds. Make sure your keyframe interval is at 1second or less.
