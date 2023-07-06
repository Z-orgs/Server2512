# Use a base image that includes Maven and Java
FROM maven:3.8.7-openjdk-18-slim

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file to the working directory
COPY pom.xml .

# Download project dependencies
RUN mvn dependency:go-offline -B

# Copy the rest of the source code to the working directory
COPY . .

# Build the application
RUN mvn package

# Specify the command to run your application
CMD ["java", "-jar", "target/NinjaServer.jar"]
