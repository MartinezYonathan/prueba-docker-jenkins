FROM openjdk:8-jdk-slim
RUN pwd
ADD ./target/demo-docker-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8881
ENTRYPOINT ["java","-jar","app.jar"]
