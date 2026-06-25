# Build stage
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests -B

# Runtime stage
FROM maven:3.9-eclipse-temurin-21
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
COPY --from=build /root/.m2 /root/.m2
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
