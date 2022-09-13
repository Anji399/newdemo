FROM maven as build 
WORKDIR /app
COPY . .
RUN mvn clean install 

FROM openjdk:11.0.10-jre
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
