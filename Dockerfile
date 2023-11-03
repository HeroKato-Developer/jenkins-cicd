FROM node
WORKDIR /mnt 
COPY package*.json ./ 
RUN npm install
COPY . . 
EXPOSE 8000
CMD [ "node", "index.js" ]