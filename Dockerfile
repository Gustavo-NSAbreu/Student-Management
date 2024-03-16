FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app
COPY pom.xml /app/pom.xml
COPY src /app/src
RUN mvn clean package

FROM tomcat:9.0.86-jdk11-corretto-al2
COPY --from=build /app/target /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]