# docker build -t mynginx .
FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/
COPY 404.html /usr/share/nginx/html/
COPY 500.html /usr/share/nginx/html/
# RUN apt update -y && apt-get install -y postgresql-client
