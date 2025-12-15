FROM maven:3.9.7-amazoncorretto-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /opt/eureka

ENV SERVER_PORT=8761
ENV SPRING_PROFILES_ACTIVE=prod

RUN addgroup --system eureka && adduser --system --ingroup eureka eureka
USER eureka

# Copy JAR từ stage "build"
COPY --from=build /app/target/*.jar eureka-server.jar

EXPOSE 8761
CMD ["java","-jar","eureka-server.jar"]
