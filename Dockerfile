FROM node:20.8.1-bullseye-slim
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "./"]

RUN npm install

COPY . .

CMD [ "node", "index.js" ]

FROM php:apache

WORKDIR /var/www/html
COPY web .

ENV PORT=8000
EXPOSE ${PORT}

RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf
