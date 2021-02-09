FROM node:alpine
RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app/views
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY server.js /usr/src/app/
COPY toRomanNumeral.js /usr/src/app/
COPY views/*.ejs /usr/src/app/views/
RUN npm install
EXPOSE 8099
ENTRYPOINT ["node", "server.js"]