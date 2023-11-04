FROM node
WORKDIR /mnt 
COPY package*.json ./ 
RUN npm install
RUN npm run compile
COPY . . 
EXPOSE 8000
CMD [ "node", "dist/ServiceStart.js" ]