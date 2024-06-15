openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/CN=mydockercert/C=US/ST=New York/L=New York City/O=Bouncy Castles, Inc/OU=Ministry of Water Slides/emailAddress=gizaoui@gmail.com' && openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
