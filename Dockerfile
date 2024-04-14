# Use official Tomcat image as base image
FROM tomcat:9.0-jdk11-openjdk

# Set environment variables
ENV SPRING_PROFILES_ACTIVE=prod
ENV SPRING_CONFIG_LOCATION=file:///config/

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Set the working directory to Tomcat's webapps directory
WORKDIR /usr/local/tomcat/webapps

# Copy your Spring Boot application WAR file into the Tomcat webapps directory
COPY target/dptweb.war ROOT.war

# Expose port 9090 (or any other port you prefer)
EXPOSE 9090

