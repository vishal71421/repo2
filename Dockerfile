# For Java 8, try this
# FROM openjdk:8-jdk-alpine

# For Java 11, try this
FROM openjdk:11 as build

# Refer to Maven build -> finalName
ARG JAR_FILE=tsb_main-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /home/vsts/work/1/s/repofolder

# cp target/tsb_main-0.0.1-SNAPSHOT.jar /opt/app/app.jar
COPY ${JAR_FILE} tsb-mbass.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-Xms512M","-Xmx1024m","-DTSB_POD_NAME=$TSB_POD_NAME","-Dlog4j.configurationFile=config/log4j2.xml","-jar","tsb-mbass.jar"]
