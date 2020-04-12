NAME=$1
TITLE=$2
USER=$3
PASSWORD=$4
EMAIL=$5

PREFIX="$(openssl rand -hex 3)_"

# Containing directory
mkdir "${NAME}"
cd "${NAME}"

# Installation
wp core download

wp config create --dbname="${NAME}" --dbuser=root --dbpass=root --dbhost=127.0.0.1 --dbprefix="${PREFIX}"
wp config set WP_DEBUG true --raw
wp config set WP_DEBUG_DISPLAY true --raw
wp config set WP_DEBUG_LOG true --raw

wp db create

wp core install --url="http://${NAME}.test" --title="${TITLE}" --admin_user="${USER}" --admin_password="${PASSWORD}" --admin_email="${EMAIL}" --skip-email

wp option update blogdescription ''
wp option update blog_public 0

wp user meta update 1 show_admin_bar_front false
wp user meta update 1 show_welcome_panel 0

wp rewrite structure '/%postname%/'
wp rewrite flush

# Deletes all preinstalled plugins
wp plugin delete --all

# Deletes all preinstalled themes including the active one
wp theme delete --all --force

# Creates and activates the theme
cd wp-content/themes

# Downloads the starter theme
git clone https://github.com/andreinadaban/wp-theme.git
cd wp-theme
rm -rf .git
cd ../
mv wp-theme "${NAME}"
cd "${NAME}"
rm readme.md
touch readme.md

cd ../../../

wp theme activate "${NAME}"
