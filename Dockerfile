FROM tomcat:9.0-jdk11-openjdk

# Remove existing application files in Tomcat webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Copy your Spring Boot application WAR file into the Tomcat webapps directory
COPY target/dptweb.war ROOT.war

# Expose port 8080 (default Tomcat port)
EXPOSE 8080
