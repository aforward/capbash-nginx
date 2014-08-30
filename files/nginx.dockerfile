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

RUN \
  apt-get install -y inotify-tools

# @PHP_INSTALL@
# @MYSQL_INSTALL@

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/etc/nginx/sites-available", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

CMD run-parts /var/local/nginx/startup.d && nginx

# Expose ports.
EXPOSE 80
EXPOSE 443