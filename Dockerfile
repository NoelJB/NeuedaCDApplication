# Stage 1: Build the React App
FROM node:20.10.0 as ReactBuild

WORKDIR /opt/build

COPY frontend .
RUN ls -l
RUN npm install && npm run build

# Stage 2: Build the SpringBoot application
FROM maven:3.9.8-eclipse-temurin-17-alpine as JavaBuild

# Set the working directory in the container
WORKDIR /opt/build

# Copy the pom.xml and download the dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code into the container
COPY src ./src

# Copy the React app
COPY --from=ReactBuild /opt/build/out src/main/resources/static/

# Package the application (skip tests to speed up the build process)
RUN mvn -f /opt/build clean package

# Set the working directory in the container
WORKDIR /opt/build/target

# Copy the jar file from the build stage
#RUN mv /opt/build/target/*.jar app.jar

FROM eclipse-temurin:17

COPY --from=JavaBuild /opt/build/target/*.jar app.jar

# Expose the port on which the application runs
EXPOSE 8100

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
