# Build the application first using Maven
FROM maven:3.8-openjdk-11 as build
RUN cd /home/dockeradmin/microservicios/prueba-docker-jenkins
RUN pwd
RUN mvn install

FROM openjdk:8-jre-alpine
RUN cd /home/dockeradmin/microservicios/prueba-docker-jenkins
COPY "./target/demo-docker-0.0.1-SNAPSHOT.jar" "app.jar"
COPY entrypoint.sh ./
RUN chmod 775 entrypoint.sh
ENTRYPOINT /entrypoint.sh
EXPOSE 8881
