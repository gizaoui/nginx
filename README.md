# NGINX

- Build du *Dockerfile* : `docker build -t mynginx .`
- Installation & lancement [port 8000](localhost:8000) : `docker run --name mynginx --rm -it -p 8000:80 mynginx:latest`
- Connexion au conteneur (`cd /usr/share/nginx/html`) : `docker exec -it mynginx /bin/bash`
- Test des fichiers de configuration : `nginx -t`


## Liens

- [NGINX en tant que serveur web](https://www.it-connect.fr/debian-comment-installer-nginx-en-tant-que-serveur-web/)
