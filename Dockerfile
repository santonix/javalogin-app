# Use an existing image as a base
FROM tomcat:9.0-jdk11-openjdk

# Remove the existing contents of the webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file into the webapps directory
COPY /target/dptweb-1.0.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 9090
EXPOSE 9090
CMD ["catalina.sh", "run"]

