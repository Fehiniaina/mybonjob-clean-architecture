FROM nginx:1.20-alpine

COPY docker/nginx/conf.d /etc/nginx/conf.d/
COPY symfony/public /var/www/symfony/public
COPY docker/nginx/nginx.crt /etc/ssl
COPY docker/nginx/nginx.key /etc/ssl
