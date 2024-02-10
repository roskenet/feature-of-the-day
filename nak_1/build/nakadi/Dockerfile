FROM registry.opensource.zalan.do/library/eclipse-temurin-11-jdk:latest

MAINTAINER f.roske@roskenet.de

WORKDIR /
ADD app.jar nakadi.jar

EXPOSE 8080

ENTRYPOINT exec java -Djava.security.egd=file:/dev/./urandom -Dspring.jdbc.getParameterType.ignore=true -jar nakadi.jar
