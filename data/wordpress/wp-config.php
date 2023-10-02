<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'taeypark' );

/** Database password */
define( 'DB_PASSWORD', 'abcde' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          ' RQD)kip+]gCg0+FT|D&><%,sRr^a_+:M8Uw22o_x%&LBFGsd9iSl0w1feg.xhLQ' );
define( 'SECURE_AUTH_KEY',   '~tHa>$]@lY(sp3H3a?%%#q!&)r _qW?xp +|bOH)vxK_#`9asM:?K=DN*:{:>O2]' );
define( 'LOGGED_IN_KEY',     'DP/wrjnJ2EPl$Ml_eB=K;3:6!M e4BZ0Ns 5Wh)Y*I4rVC3TdA!Q.q1]iF1 GOGz' );
define( 'NONCE_KEY',         'N!1b]``2l1[B67L$KWPTCkCzQYT+0^A{oc:)ZGADU?&%4,tuHNE>N;|HVplf%slF' );
define( 'AUTH_SALT',         '~QV]h4}mApBf0b%Wp#r?ns.4iXDlp0];f8A/-K*n{y_|V-K02ssMw,~pX9K}lEJd' );
define( 'SECURE_AUTH_SALT',  'AeN`}>K$jS>6|=ux[e@9XGxm.prP4;L|o}uE;@$c/R`k]Ove=Zvwe:buI|v^E%5R' );
define( 'LOGGED_IN_SALT',    '((>8jtsYai|7uY>Dr_ZtdTZ54-$5*V%LXNd8$y^#>r7c}>:]Jr1q Y:i%Xlq!O[z' );
define( 'NONCE_SALT',        'pOLHu%g)[mW!)1v [`a>#;e}-%}z!?CJ2o3WZ6L]tvHyTF+Y;lv{7+> kE_-~^uY' );
define( 'WP_CACHE_KEY_SALT', '^3j}LB^mJ|VEH,0YnuLi9@e2SJo=Nc82oXb;LakzaJTb_O`Q`s9{rB&C7^a_8n,I' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
