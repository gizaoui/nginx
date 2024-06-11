# NGINX

- Build du *Dockerfile* : `docker build -t mynginx .`
- Installation & lancement [port 8000](localhost:8000) : `docker run --name mynginx --rm -it -p 8000:80 mynginx:latest`
- Connexion au conteneur (`cd /usr/share/nginx/html`) : `docker exec -it mynginx /bin/bash`
- Test des fichiers de configuration : `nginx -t`


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
