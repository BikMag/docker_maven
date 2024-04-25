FROM maven
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn install -DskipTests

FROM openjdk:19
COPY --from=maven /build/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]