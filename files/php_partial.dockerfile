# Install PHP
RUN apt-get install -y php5-fpm
RUN apt-get install -y php5-gd
RUN sed -i 's|;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|g' /etc/php5/fpm/php.ini
RUN sed -i 's|listen = 127.0.0.1:9000|listen = /var/run/php5-fpm.sock|g' /etc/php5/fpm/pool.d/www.conf