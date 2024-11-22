FROM alpine:3.14

RUN apk --no-cache update && apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off;"]

