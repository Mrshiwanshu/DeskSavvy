# Stage 1: Build the application using OpenJDK 8 and Apache Ant
FROM openjdk:8-jdk-slim AS builder

# Install Ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy all project files
COPY . .

# Run Ant to compile and build the WAR file
RUN ant dist

# Stage 2: Deploy to Apache Tomcat
FROM tomcat:8.5-jdk8-openjdk-slim

# Remove Tomcat's default web applications to keep the root path clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the builder stage as ROOT.war
COPY --from=builder /app/dist/DeskSavvy.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
