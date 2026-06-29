FROM maven:3.8-jdk-25 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

FROM tomcat:10.0-jdk25
COPY --from=build /workspace/target/recruitment-portal-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
