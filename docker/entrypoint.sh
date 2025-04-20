#!/bin/bash

if [ ! -f "vendor/autoload" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f ".env" ]; then
    echo "Creating env file"
    cp .env.example .env
fi

retry_count=0
max_retries=10
until php artisan migrate --force; do
    retry_count=$((retry_count+1))
    if [ $retry_count -ge $max_retries ]; then
        echo "Database migration failed after $max_retries attempts."
        exit 1
    fi
    echo "Database is not ready. Retrying in 5 seconds..."
    sleep 5
done

php-fpm -D
nginx -g "daemon off;"