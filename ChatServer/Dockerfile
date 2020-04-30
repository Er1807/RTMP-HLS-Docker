FROM ubuntu

#From https://github.com/WebDevSimplified/Realtime-Simple-Chat-App
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install nodejs npm && \
    rm -rf /var/lib/apt/lists/*

RUN npm install --save socket.io && \
    npm install --save socket.io-client


COPY server.js server.js

EXPOSE 3000

CMD [ "nodejs", "server.js" ]