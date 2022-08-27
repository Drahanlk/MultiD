FROM alpine/git
WORKDIR /Darshan
RUN git clone https://github.com/roopeshraaghu/java_repo1.git

FROM maven:3.5-jdk-8-alpine
WORKDIR /java
COPY --from=0 /Darshan/java_repo1 /java
RUN mvn install

FROM adhig93/tomcat-conf
WORKDIR /Darshan
COPY --from=1 /java/target/*war /usr/local/tomcat/webapps/
