# Install PHP
RUN apt-get install -y php5-fpm php5-gd php5-curl php5-xmlrpc php5-intl
RUN sed -i 's|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g' /etc/php5/fpm/php.ini && \
  sed -i 's|listen = 127.0.0.1:9000|listen = /var/run/php5-fpm.sock|g' /etc/php5/fpm/pool.d/www.conf
ADD files/php5_fpm /etc/nginx/startup.d/php5_fpm
