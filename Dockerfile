FROM node:alpine AS deps

ENV NODE_ENV production

RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY ["package.json", "yarn.lock", "./"]
RUN yarn install --frozen-lockfile
COPY . .

CMD ["node", "server.js"]
