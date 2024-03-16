FROM node:18-alpine as build

WORKDIR /app

COPY . .

RUN yarn

RUN yarn build

EXPOSE 8080
RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]


FROM nginx:stable-alpine as production-stage
ENV TZ 'Asia/Ho_Chi_Minh'

WORKDIR /app

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

COPY entrypoint.sh ./

RUN chmod u+x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]