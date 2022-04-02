FROM maven:3.8.4-openjdk-17-slim AS build

COPY src /home/app/src

COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package

RUN ls /home/app/target

# FROM openjdk:17-alpine

# ARG JAR_FILE=target/*.jar

# WORKDIR /app
# COPY ${JAR_FILE} parloIO.jar

ENTRYPOINT ["java", "-jar", "/home/app/target/talkIO.jar"]