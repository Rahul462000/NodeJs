#stage1
FROM node:22-slim as Builder

WORKDIR /app

COPY  package.json package-lock.json ./

COPY . .

RUN npm install --only=production --target=/app/deps

#stage2
FROM gcr.io/distroless/nodejs22-debian12

WORKDIR /app
COPY --from=Builder /app/deps  /app/deps    

COPY  --from=Builder /app .

ENV NODEPATH="/app/deps"

EXPOSE 80

CMD [ "node", "server.js" ]