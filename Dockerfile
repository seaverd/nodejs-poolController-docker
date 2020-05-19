FROM node:lts
WORKDIR /usr/local/nodejs-poolController
RUN git clone --depth 1 -b next https://github.com/tagyoureit/nodejs-poolController.git .
RUN npm ci
RUN npm run build
EXPOSE 4200
ENTRYPOINT ["node", "dist/app.js"]