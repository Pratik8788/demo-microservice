
# Use Eclipse Temurin JDK as base image
FROM eclipse-temurin:21-jdk

# Set working directory inside the container
WORKDIR /app

# Copy the Gradle build output jar into the container
COPY build/libs/*.jar app.jar

# Expose the port your Spring Boot app runs on


# Command to run the Spring Boot application
ENTRYPOINT ["java","-jar","app.jar"]