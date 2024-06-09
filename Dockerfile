# docker build -t mynginx .

# FROM nginx:latest

## localhost
# COPY default.conf /etc/nginx/conf.d/
# COPY 404.html /usr/share/nginx/html/
# COPY 500.html /usr/share/nginx/html/

## http://it-connect.tech:8000/ NE FONCTION PAS
# RUN mkdir -p /usr/share/nginx/it-connect.tech
# COPY index.html /usr/share/nginx/it-connect.tech/
# RUN mkdir -p /etc/nginx/sites-available
# RUN mkdir -p /etc/nginx/sites-enabled
# COPY it-connect.tech /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/it-connect.tech /etc/nginx/sites-enabled/it-connect.tech
# RUN apt update -y && apt -y install lsb-release apt-transport-https ca-certificates postgresql-client
