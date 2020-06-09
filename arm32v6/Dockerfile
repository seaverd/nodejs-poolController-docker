FROM arm32v6/node:lts-alpine as builder
ARG TAG=next
RUN apk add --no-cache git python build-base linux-headers udev
WORKDIR /work
RUN npx degit tagyoureit/nodejs-poolController#${TAG}
RUN npm ci
RUN npm run build

FROM arm32v6/node:lts-alpine
WORKDIR /usr/local/nodejs-poolController
COPY --from=builder /work/node_modules ./node_modules
# Consider moving these files to dist folder
COPY --from=builder /work/LICENSE /work/defaultConfig.json /work/package.json ./
COPY --from=builder /work/dist ./dist
EXPOSE 4200
VOLUME [ "/usr/local/nodejs-poolController/data" ]
ENTRYPOINT ["node", "dist/app.js"]