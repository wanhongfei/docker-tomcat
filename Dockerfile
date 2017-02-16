FROM wanhongfei/java:latest

MAINTAINER wwhhff11 "1272700372@qq.com"

### base software
RUN mkdir -p /home/software

### tomcat
ADD /tomcat/apache-tomcat-8.5.11.tar.gz /home/software/
ENV CATALINA_HOME=/home/software/apache-tomcat-8.5.11
ENV PATH=$PATH:$CATALINA_HOME/bin

RUN mv /home/software/apache-tomcat-8.5.11/conf/tomcat-users.xml /home/software/apache-tomcat-8.5.11/conf/tomcat-users.xml.bak
ADD /tomcat/tomcat-users.xml /home/software/apache-tomcat-8.5.11/conf/

### port 8080
EXPOSE 8080

### startup
ENTRYPOINT ["/home/software/apache-tomcat-8.5.11/bin/catalina.sh", "run" ]