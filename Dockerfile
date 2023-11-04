FROM alpine
ARG CACHEBUST=1 

RUN apk add --update nodejs npm curl

WORKDIR /opt
RUN rm -rf ./*

# WORKDIR /mnt
# COPY ./name.env /mnt/name.env
# COPY ./version.env /mnt/version.env

WORKDIR /mnt/math
COPY package*.json ./
RUN npm install
COPY . . 

WORKDIR /mnt/math
CMD ["node", "./dist/ServiceStart.js"]