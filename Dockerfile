FROM node:lts-alpine as build

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install --production
RUN npm i -S @vue/cli-service

COPY . .

RUN npm run build

EXPOSE 8080
RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]


FROM nginx:stable-alpine as production-stage
ENV TZ 'Asia/Ho_Chi_Minh'

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80



RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]