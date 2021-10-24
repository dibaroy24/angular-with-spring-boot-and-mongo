FROM openjdk:8-jdk-alpine
<<<<<<< HEAD
EXPOSE 8081
=======
>>>>>>> refs/remotes/origin/master
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"] 