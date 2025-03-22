FROM node:22-alpine

WORKDIR /app

COPY package.json /app
COPY pnpm-lock.yaml /app

RUN npm install -g pnpm

RUN pnpm install

COPY . /app

RUN pnpm build

EXPOSE 3000

CMD ["node", "dist/main.js"]