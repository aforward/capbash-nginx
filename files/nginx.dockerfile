# Nginx Dockerfile
# https://github.com/dockerfile/nginx
FROM ubuntu:14.04

RUN apt-get -qq update
RUN apt-get install -y wget git build-essential

# Install Nginx.
RUN \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get -qq update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  sed -i 's|# server_names_hash_bucket_size|server_names_hash_bucket_size|g' /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN mkdir -p /etc/nginx/startup.d

ADD files/do_nothing /etc/nginx/startup.d/do_nothing

# @PHP_INSTALL@
# @MYSQL_INSTALL@
# @RELOAD_INSTALL@

RUN chmod 755 -R /etc/nginx/startup.d

VOLUME ["/data", "/etc/nginx/sites-enabled", "/etc/nginx/sites-available", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD run-parts /etc/nginx/startup.d && nginx

# Expose ports.
EXPOSE 80
EXPOSE 443