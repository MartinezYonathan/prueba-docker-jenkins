FROM openjdk:8-jdk-alpine AS runner
RUN ls -a
COPY "./target/demo-docker-0.0.1-SNAPSHOT.jar" "app.jar"
COPY entrypoint.sh ./
RUN chmod 775 entrypoint.sh
ENTRYPOINT /entrypoint.sh
EXPOSE 8881
