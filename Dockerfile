# Build Spring Boot Eureka Server (Runtime stage only)
FROM eclipse-temurin:17-jdk

ARG JAR_FILE=target/eureka-server-0.0.1-SNAPSHOT.jar
WORKDIR /app
COPY ${JAR_FILE} app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]