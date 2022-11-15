
From tomcat:latest as ana

RUN apt-get update && apt-get upgrade -y && apt-get install nano -y

FROM ana

EXPOSE "8080:80"
EXPOSE "8081:81"

ENV CATALINA_BASE "/usr/local/tomcat"

COPY ./webapps/ $CATALINA_BASE/webapps/
RUN rm $CATALINA_BASE/conf/server.xml
COPY ./server.xml $CATALINA_BASE/conf/


ENTRYPOINT [ "catalina.sh","run" ]
