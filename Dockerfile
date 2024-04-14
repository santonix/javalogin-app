FROM tomcat:9.0-jdk11-openjdk

# Remove existing application files in Tomcat webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*

# Set the working directory
WORKDIR /usr/local/tomcat/webapps

# Copy your Spring Boot application WAR file into the Tomcat webapps directory
COPY  /home/bonny/WEBAPPS/javalogin-app/target/dptweb-1.0.war  ROOT.war

# Expose port 9090 (default Tomcat port)
EXPOSE 9090
