FROM node:13.12.0-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN apk update && apk add --no-cache -u \
    python \
    curl \
    libzip-dev \
    libpng-dev \
    libwebp-tools\
    libjpeg \
    libwebp-dev \
    libwebp \
    jpeg-dev \
    libmcrypt-dev \
    g++ \
    automake \
    autoconf \
    libtool \
    nasm \
    gcc \
    gifsicle \
    zlib \
    unzip
RUN npm cache clean --force
RUN npm install -g webpack
RUN npm install -g forever
RUN npm install --force
COPY . ./

EXPOSE 8081
CMD forever -c "npm start" ./