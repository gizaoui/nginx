# docker network create -d bridge net_common
# drm && docker build -t mytomcat .
# docker run --name mytomcat --rm -it -p 8080:8080 -n net_common -v ./webapps:/usr/local/tomcat/webapps mytomcat:latest
FROM tomcat:10.1
COPY server.xml /usr/local/tomcat/conf/server.xml
EXPOSE 8080
CMD ["catalina.sh", "run"]
