echo "yes" | php artisan migrate
if [-e storage/oauth-private.key]
then 
    echo "Not Generating Passport"
else 
    php artisan passport:install
fis