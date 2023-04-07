FROM centos:latest
MAINTAINER chaudharybhoomika12@gmail.com

# Update appstream repo and install httpd, zip, and unzip packages
RUN yum clean all && yum makecache && \
    yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all

# Download and extract website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start httpd service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80