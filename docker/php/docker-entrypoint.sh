#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ] || [ "$1" = 'bin/console' ]; then
    composer dump-autoload --optimize --no-dev --classmap-authoritative
    composer install --prefer-dist --no-progress --no-suggest --no-interaction --optimize-autoloader
    bin/console assets:install public

    #drop all schema && migrate
    bin/console doctrine:schema:drop --force --full-database
    bin/console doctrine:migrations:migrate
    bin/console doctrine:fixtures:load

    #generer toutes les templates dust
    bin/console generate:dustTemplates
    bin/console dust:generate:templates

    bin/console fos:js-routing:dump --format=json --target=public/js/fos_js_routes.json
    yarn install
    yarn encore dev
    #yarn encore production

    bin/phpunit

	# Permissions hack because setfacl does not work on Mac and Windows
	chown -R www-data var
fi

exec docker-php-entrypoint "$@"
