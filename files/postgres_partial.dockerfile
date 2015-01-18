# Install POSTGRES
RUN apt-get install -y php5-pgsql
ADD files/postgres_host /etc/nginx/startup.d/postgres_host
