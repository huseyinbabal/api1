FROM openjdk:8u191-jdk-alpine3.9

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY target/*.jar ./app.jar

CMD ["java", "-jar", "app.jar"]