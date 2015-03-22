capbash-nginx
==============

Scripts for installing [nginx](http://nginx.org/) an HTTP and reverse proxy server, as well as a mail proxy server, written by Igor Sysoev.

# How to Install #

Install capbash first, more details at:
https://github.com/aforward/capbash

```
curl -s https://raw.githubusercontent.com/aforward/capbash/master/capbash-installer | bash
capbash new YOUR_REPO_ROOT
cd YOUR_REPO_ROOT
```

Now you can install nginx into your project

```
capbash install nginx
```

# Configurations #

The available configurations include:

```
NGINX_SITES_ENABLED_DIR=${NGINX_SITES_ENABLED_DIR-/etc/nginx/sites-enabled}
NGINX_SITES_AVAILABLE_DIR=${NGINX_SITES_AVAILABLE_DIR-/etc/nginx/sites-available}
LOG_DIR=${LOG_DIR-/var/log}
NGINX_LOG_DIR=${GIT_LOG_DIR-$LOG_DIR/nginx}
NGINX_HTTP_PORT=${NGINX_HTTP_PORT-80}
NGINX_SSL_PORT=${NGINX_SSL_PORT-443}
NGINX_APPS_DIR=${NGINX_APPS_DIR-/var/local/apps}
NGINX_INCLUDE_PHP=${NGINX_INCLUDE_PHP-true}
```

You will need to configure your installer to drop NGINX config files into $NGINX_SITES_ENABLED_DIR, and they should reference
applications deployed to $NGINX_APPS_DIR.

For example

```
vi /etc/nginx/sites-enabled/default
server {
  listen       80;
  server_name  0.0.0.0;
  client_max_body_size 4G;
  root /var/local/apps/example;
  index index.html;
}
```

And, then

```
mkdir -p /var/local/apps/example
echo "HELLO WORLD" > /var/local/apps/example/index.html
```

Now, when you start the daemon,

```
/var/local/nginx/start
```

You should be able to see the sample page (replace the IP address) at

```
http://127.0.0.1
```


# Deploy to Remote Server #

To push the nginx script to your server, all you need if the IP or hostname of your server (e.g. 192.167.0.48) and your root password.

```
capbash deploy <IP> nginx
```

For example,

```
capbash deploy 127.0.0.1 nginx
```
