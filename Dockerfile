FROM openjdk:17-alpine
ARG JAR_FILE=target/*.jar

WORKDIR /app
COPY ${JAR_FILE} parloIO.jar

ENTRYPOINT ["java", "-jar", "parloIO.jar"]