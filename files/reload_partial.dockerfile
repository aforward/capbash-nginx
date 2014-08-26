RUN apt-get install -y inotify-tools
ADD files/touchandgo /usr/local/bin/touchandgo
ADD files/nginx_reload /usr/local/bin/nginx_reload
ADD files/nginx_touch /etc/nginx/startup.d/nginx_touch
RUN chmod 755 /usr/local/bin/touchandgo /usr/local/bin/nginx_reload