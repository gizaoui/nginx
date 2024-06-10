# postgres

## docker

- Pull & launch : `docker run --name basic-postgres --rm -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e PGDATA=/var/lib/postgresql/data/pgdata/pgdata --volume /tmp:/var/lib/postgresql/data/pgdata -p 5432:5432 -it postgres:14.1-alpine`
- Liste des points de montage : `docker inspect basic-postgres | jq '.[]' | jq '.Mounts[]'`

## docker-compose

Le fichier de configuration *docker-compose.yaml* utilise l'image de façon direct (sans *Dockerfile*).<br>
Installer le client *Postgres* sur le machine hôte (`apt-cache search postgresql-client-*`)

- Intallation & lancement de l'image : `docker-compose up -d`
- Connexion à la base de données du *host* (liste des table : `\dt`) : `PGPASSWORD='postgres' psql -h localhost -U postgres -d mydb`
- Test : `docker-compose ps`
- Connexion au *container*. Se positionner en `su - postgres` pour se connecter à la base : `docker exec -it basic-postgres /bin/bash`
- Arrêt et suppression : `docker-compose down`
- Suppression du volume (en *root*) `\rm -fr su - /home/gizaoui/git/github/postgres/data`

### Commande *Postgres* 

- Liste des utilisateurs : `\du+`
- Liste des bases de données : `\l+`
- Liste des tables : `\dt+`
- Détail d'une table : `\d+ users`

### Montage de volume (*./data*)

- Intallation & lancement d'uns image *Debian* avec partage du volume *./data* (lance interactif -> *sleep infinity* inutile ) :<br>
`docker run --name mydeb --rm -it --mount type=bind,source=/home/gizaoui/git/github/postgres/data,destination=/mnt debian:12.5-slim`


## NGINX

- Build du *Dockerfile* : `docker build -t mynginx .`
- Installation & lancement [port 8000](localhost:8000) : `docker run --name mynginx --rm -it -p 8000:80 mynginx:latest`
- Connexion au conteneur (`cd /usr/share/nginx/html`) : `docker exec -it mynginx /bin/bash`
- Test des fichiers de configuration : `nginx -t`


### Liens

- [nginx en tant que serveur web](https://www.it-connect.fr/debian-comment-installer-nginx-en-tant-que-serveur-web/)
- [nginx & php:7.4-fpm](https://gist.github.com/DanRibbens/f99147436b6f3ed270cd27a30519effc)

docker build -t myphp-fpm -f dockerfile_php_fpm . && docker build -t mynginx -f dockerfile_nginx . && docker-compose up