# Build the application first using Maven

FROM openjdk:8-jdk-alpine AS runner
RUN pwd
COPY "./var/lib/jenkins/.m2/repository/com/example/demo-docker/0.0.1-SNAPSHOT/demo-docker-0.0.1-SNAPSHOT.jar" "app.jar"
COPY entrypoint.sh .
RUN chmod +x /entrypoint.sh
ARG general_cash_port=8881
ENV server.max-http-header-size=16384 \
    cassandra.clusterName="datacenter1" \
    server.port=$general_cash_port \
    system.initialclientid=service-runner
WORKDIR /tmp
COPY  ./service/build/libs/demo-docker-0.0.1-SNAPSHOT.jar ./demo-docker-SNAPSHOT.jar
ENTRYPOINT /entrypoint.sh
EXPOSE 8881
