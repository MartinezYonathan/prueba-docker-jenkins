# Build the application first using Maven
FROM openjdk:8-jre-alpine
RUN pwd
COPY "./var/lib/jenkins/.m2/repository/com/example/demo-docker/0.0.1-SNAPSHOT/demo-docker-0.0.1-SNAPSHOT.jar" "app.jar"
COPY entrypoint.sh ./
RUN chmod 775 entrypoint.sh
ENTRYPOINT /entrypoint.sh
EXPOSE 8881
