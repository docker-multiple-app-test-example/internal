FROM node:8.9.4-alpine

EXPOSE 8000

RUN mkdir -p /projects/internal
WORKDIR /projects/internal

COPY package.json package-lock.json* ./
RUN npm install && npm cache clean --force

COPY . /project/internal

CMD ["node", "src/index.js"]