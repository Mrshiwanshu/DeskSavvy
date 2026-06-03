# Stage 1: Build the application using standard javac and jar tools
FROM tomcat:8.5-jdk8-temurin AS builder

WORKDIR /app

# Copy all project files
COPY . .

# Create classes directory inside WEB-INF
RUN mkdir -p web/WEB-INF/classes

# Compile all Java sources under src/java into classes directory
RUN find src/java -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes -cp "/usr/local/tomcat/lib/*:web/WEB-INF/lib/*" @sources.txt

# Package the web/ directory into a WAR file
RUN mkdir -p dist && \
    cd web && \
    jar cf ../dist/DeskSavvy.war .

# Stage 2: Deploy to Apache Tomcat
FROM tomcat:8.5-jdk8-temurin

# Remove Tomcat's default web applications to keep the root path clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the builder stage as ROOT.war
COPY --from=builder /app/dist/DeskSavvy.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
