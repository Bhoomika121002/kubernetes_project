FROM centos:latest

MAINTAINER chaudharybhoomika12@gmail.com

# Disable the appstream repo
RUN sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/CentOS-Linux-AppStream.repo

RUN yum update -y && \
    yum install -y httpd \
                   zip \
                   unzip && \
    yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
