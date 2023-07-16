FROM centos:7
MAINTAINER avishek.8016293999@gmail.com

# Install dependencies
RUN yum install -y httpd \
    zip \
    unzip

# Add website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/loxury.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip loxury.zip
RUN cp -rvf loxury/* .
RUN rm -rf loxury loxury.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
