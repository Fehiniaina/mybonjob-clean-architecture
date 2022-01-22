#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

#if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ]; then
    #composer dump-autoload --optimize --no-dev --classmap-authoritative
    #composer install --prefer-dist --no-progress --no-suggest --no-interaction --optimize-autoloader

    #drop all schema && migrate
    #bin/console doctrine:schema:drop --force --full-database
    #bin/console doctrine:migrations:migrate
    #bin/console doctrine:fixtures:load
#fi

exec docker-entrypoint "$@"
