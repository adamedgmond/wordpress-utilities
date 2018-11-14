#!/bin/bash
# This script takes two arguments: the site name, the title of the wordpress site
# e.g. $ pantheon-wp-start-state.sh your-site-name "My Handy Blog"

read -r -p "[notice] This might take a while.  Are you sure you want to create a Pantheon WordPress Site $2 with site name $1? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then

	echo "";
	echo "*****************************************************" ;
	echo "Creating Pantheon WordPress site..."
	echo "*****************************************************" ;
	echo "";

	terminus site:create -- $1 $1 WordPress

	terminus wp $1.dev -- core install --skip-email --title="$2" --admin_user="my_name" --admin_password="my_password" --admin_email=my@email.com --url=http://dev-$1.pantheonsite.io/

	echo "";
	echo "*****************************************************" ;
	echo "WordPress installed"
	echo "*****************************************************" ;
	echo "";

	terminus connection:set $1.dev sftp

	echo "";
	echo "*****************************************************" ;
	echo "Site in SFTP mode"
	echo "*****************************************************" ;
	echo "";

	terminus wp $1.dev -- plugin delete hello
	terminus wp $1.dev -- plugin delete akismet

	echo "";
	echo "*****************************************************" ;
	echo "Extra plugins baleeted"
	echo "*****************************************************" ;
	echo "";

	terminus wp $1.dev -- theme delete twentyten
	terminus wp $1.dev -- theme delete twentyeleven
	terminus wp $1.dev -- theme delete twentytwelve
	terminus wp $1.dev -- theme delete twentythirteen
	terminus wp $1.dev -- theme delete twentyfourteen
	terminus wp $1.dev -- theme delete twentyfifteen
	terminus wp $1.dev -- theme delete twentysixteen

# twentyseventeen kept as it is active on install

	echo "";
	echo "*****************************************************" ;
	echo "Extra themes deep-sixed"
	echo "*****************************************************" ;
	echo "";

	terminus wp $1.dev -- plugin install a3-lazy-load --activate
	terminus wp $1.dev -- plugin install autoptimize --activate
	terminus wp $1.dev -- plugin install debug-bar --activate
	terminus wp $1.dev -- plugin install debug-bar-list-dependencies --activate
	terminus wp $1.dev -- plugin install debug-bar-slow-actions --activate
	terminus wp $1.dev -- plugin install duplicate-post --activate
	terminus wp $1.dev -- plugin install enable-media-replace --activate
	terminus wp $1.dev -- plugin install force-strong-passwords --activate
	terminus wp $1.dev -- plugin install imsanity --activate
	terminus wp $1.dev -- plugin install limit-login-attempts-reloaded --activate
	terminus wp $1.dev -- plugin install plugin-notes-plus --activate
	terminus wp $1.dev -- plugin install redirection --activate
	terminus wp $1.dev -- plugin install resmushit-image-optimizer --activate
	terminus wp $1.dev -- plugin install safe-svg --activate
	terminus wp $1.dev -- plugin install wp-crontrol --activate
	terminus wp $1.dev -- plugin install wp-native-php-sessions --activate
	terminus wp $1.dev -- plugin install wp-optimize --activate
	terminus wp $1.dev -- plugin install wordpress-seo --activate

	echo "";
	echo "*****************************************************" ;
	echo "Required plugins kit installed and activated"
	echo "*****************************************************" ;
	echo "";

fi
