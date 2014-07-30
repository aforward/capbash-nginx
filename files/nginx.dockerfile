# Nginx Dockerfile
# https://github.com/dockerfile/nginx
FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget git build-essential

# Install Nginx.
RUN \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

RUN \
  apt-get install -y inotify-tools

# @PHP_INSTALL@

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

CMD run-parts /var/apps/nginx/startup.d && nginx

# Expose ports.
EXPOSE 80
EXPOSE 443