FROM node:lts as builder
WORKDIR /work
RUN npx degit tagyoureit/nodejs-poolController#next
RUN npm ci
RUN npm run build

FROM node:lts-alpine
WORKDIR /usr/local/nodejs-poolController
COPY --from=builder /work .
EXPOSE 4200
VOLUME [ "/usr/local/nodejs-poolController/data" ]
ENTRYPOINT ["node", "dist/app.js"]