# Stage 1: Build the application using Tomcat base image to have access to JEE APIs
FROM tomcat:8.5-jdk8-temurin AS builder

# Install Apache Ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy all project files
COPY . .

# Run Ant to compile and build the WAR file with correct JEE classpath and copylibs jar
RUN ant \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Dj2ee.platform.classpath=/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/lib/jsp-api.jar:/usr/local/tomcat/lib/el-api.jar \
    dist

# Stage 2: Deploy to Apache Tomcat
FROM tomcat:8.5-jdk8-temurin

# Remove Tomcat's default web applications to keep the root path clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the builder stage as ROOT.war
COPY --from=builder /app/dist/DeskSavvy.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
