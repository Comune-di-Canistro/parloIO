FROM maven:3.8.4-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /home/app/target/talkIO.jar /app/talkIO.jar
ENTRYPOINT ["java", "-jar", "./talkIO.jar"]