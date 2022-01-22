FROM nginx:1.15-alpine

COPY docker/nginx/conf.d /etc/nginx/conf.d/
COPY public /var/www/symfony/public
COPY docker/nginx/nginx.crt /etc/ssl
COPY docker/nginx/nginx.key /etc/ssl
