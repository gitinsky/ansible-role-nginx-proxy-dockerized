FROM gitinsky/baseimage:0.1.1
MAINTAINER Git In Sky <support@gitinsky.com>
EXPOSE 80

RUN apt-get update && apt-get -y install nginx && unlink /etc/nginx/sites-enabled/default
ADD nginx.rb /etc/eye/nginx.rb
ADD sites-available/* /etc/nginx/sites-available/
RUN find /etc/nginx/sites-available/ -type f -exec ln -s {} /etc/nginx/sites-enabled/ \;
