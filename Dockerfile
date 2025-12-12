FROM openjdk:17-jre-slim
WORKDIR /opt/eureka

ENV SERVER_PORT=8761
ENV SPRING_PROFILES_ACTIVE=prod

RUN addgroup --system eureka \
    && adduser --system --ingroup eureka eureka
USER eureka

COPY --from=build /app/target/*.jar eureka-server.jar

EXPOSE 8761

CMD ["java", "-jar", "eureka-server.jar"]
