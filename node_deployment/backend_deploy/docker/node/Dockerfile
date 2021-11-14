FROM node:carbon

WORKDIR /app

RUN apt-get update

RUN apt-get install -y ghostscript unoconv ffmpeg imagemagick curl

RUN npm i -g node-gyp sequelize-cli nodemon --unsafe

COPY package*.json ./
COPY patches ./patches
RUN npm install --unsafe-perm

ARG ENV

ENV RUN_MODE $ENV

COPY . .

COPY ./docker/node/imagemagick-6-policy.xml /etc/ImageMagick-6/policy.xml

COPY docker/node/docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck

HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

COPY ./docker/node/start.sh /opt/start.sh

ENTRYPOINT ["/bin/bash", "/opt/start.sh"]
