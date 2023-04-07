FROM centos:latest
MAINTAINER chaudharybhoomika12@gmail.com

RUN yum clean all && \
    yum makecache && \
    yum update -y --disablerepo=appstream && \
    yum install -y httpd zip unzip --disablerepo=appstream && \
    yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80