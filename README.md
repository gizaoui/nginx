# NGINX

- Build du *Dockerfile* : `docker build -t mynginx .`
- Installation & lancement [port 8000](localhost:8000) : `docker run --name mynginx --rm -it -p 8000:80 mynginx:latest`
- Connexion au conteneur (`cd /usr/share/nginx/html`) : `docker exec -it mynginx /bin/bash`
- Test des fichiers de configuration : `nginx -t`

[phppgadmin](http://localhost:8000/phppgadmin/)

Exploitation des API via redirection *NGINX* (`location ~ /tomcat/(.*)$`)

```bash
# https://localhost:8443/tomcat/test-junit/swagger-ui/index.html
curl --insecure -X 'POST' 'https://localhost:8443/tomcat/test-junit/save' \
  -H 'accept: */*' -H 'Content-Type: application/json' \
  -d '{"lastName": "ZAOUI", "firstName": "Gilles" }'

curl --insecure -X 'GET' 'https://localhost:8443/tomcat/test-junit/all' -H 'accept: */*'
```

Exploitation des API via le *Virtual host* *example.com*

```bash
curl -X 'POST' 'http://example.com:8000/test-junit/save' \
  -H 'accept: */*' -H 'Content-Type: application/json' \
  -d '{"lastName": "ZAOUI", "firstName": "Gilles" }'

curl -X 'GET' 'http://example.com:8000/test-junit/all' -H 'accept: */*'
```

Le *swagger-ui* ne fonctionne pas à travers les *containers*.<br>
Uniquement sur la [redirection](http://localhost:8080/test-junit/swagger-ui/index.html) des ports.


### Liens

- [nginx en tant que serveur web](https://www.it-connect.fr/debian-comment-installer-nginx-en-tant-que-serveur-web/)
- [nginx & php:7.4-fpm](https://gist.github.com/DanRibbens/f99147436b6f3ed270cd27a30519effc)
- [proxy-ajp](https://forum.hackthebox.com/t/server-side-attacks-module-nginx-reverse-proxy-ajp/309581)
- [proxy-ajp](https://www.ruby-forum.com/t/ajp-from-apache-to-nginx/220915/3)
- [swagger-ui](http://localhost:8080/test-junit/swagger-ui/index.html)
- [swagger-ui](http://localhost:8000/test-junit/swagger-ui/index.html)

- https://github.com/ScribblerCoder/nginx-ajp-docker/blob/main/Dockerfile

- https://book.hacktricks.xyz/network-services-pentesting/8009-pentesting-apache-jserv-protocol-ajp
- https://book.hacktricks.xyz/v/fr/network-services-pentesting/8009-pentesting-apache-jserv-protocol-ajp



### [SSL](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-16-04)


`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/CN=mydockercert/C=US/ST=New York/L=New York City/O=Bouncy Castles, Inc/OU=Ministry of Water Slides/emailAddress=gizaoui@gmail.com' && openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048`


```json
server {
  listen 80 default_server;
  listen [::]:80 default_server;
  listen 443 ssl http2 default_server;
  listen [::]:443 ssl http2 default_server;

  server_name _;
  ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
  ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
  ssl_dhparam /etc/ssl/certs/dhparam.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
  ssl_ecdh_curve secp384r1;
  ssl_session_cache shared:SSL:10m;
  ssl_session_tickets off;
  ssl_stapling on;
  ssl_stapling_verify on;

  resolver 8.8.8.8 8.8.4.4 valid=300s;
  resolver_timeout 5s;

  add_header Strict-Transport-Security "max-age=63072000; includeSubdomains";
  add_header X-Frame-Options DENY;
  add_header X-Content-Type-Options nosniff;

  index index.html;
  root /var/www/html;

  location / {
      try_files $uri $uri/ =404; # Vérifie l'existence du fichier ou du dossier (définie par "$uri/")
  }
}
```

