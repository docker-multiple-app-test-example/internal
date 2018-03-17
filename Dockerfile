FROM node:8.9.4-alpine

RUN mkdir -p /projects/internal
WORKDIR /projects/internal

COPY package.json package-lock.json* ./
RUN npm install && npm cache clean --force

COPY . /projects/internal

CMD ["node", "src/index.js"]
