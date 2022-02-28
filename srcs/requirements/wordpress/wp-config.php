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
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', WORDPRESS_DB_NAME ); // ! defined in environment of docker-compose

/** Database username */
define( 'DB_USER', WORDPRESS_DB_USER ); // ! defined in environment of docker-compose

/** Database password */
define( 'DB_PASSWORD', WORDPRESS_DB_PASSWORD ); // ! defined in environment of docker-compose

/** Database hostname */
define( 'DB_HOST', WORDPRESS_DB_HOST ); // ! defined in environment of docker-compose

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
define('AUTH_KEY',         'm76rh4}+y,(os`-#07s+$Vq7F:5KFvNoy<_+z?D6p$$di]pe*h>6*Yh)~y_e:!1P');
define('SECURE_AUTH_KEY',  'SUyeLD=Fw2|E~N`LWUMVpe|g7IkP[?,u3-U%pM>)41]lo&&Q;o4G+~)>OKd%Y?ym');
define('LOGGED_IN_KEY',    '#7uY>P]83oDq(_wIkXppdl F?UU>u6<Q(sBqmxSyWCqYYf?[NYhT<`BTXjy<`hpP');
define('NONCE_KEY',        '5ESOZwk*!qv>o(:3+1Hjo+ ~`nJ 8UsWO[%qh@&-e]l-MI_t0^F-gFAlqZ43EKR;');
define('AUTH_SALT',        'v;@sC6*./NV-Ct*]h#yeICX?<mVb5:.DNq2@Z<<C/PL8)qC5$.Dbd7~9?9UHDTk4');
define('SECURE_AUTH_SALT', ':i-}CC#n&$7i|Faqb)`pV-xzKBa))bk~u=2$Z@(+r-@m,2$+rqH/mL_d[y8,Z^51');
define('LOGGED_IN_SALT',   'FScb7!K8ShwL^rl-5V<ZQL xz1J%p~+?]+LD_X-?Y}JdZ?iVqKn-C0sU7;q9a}1~');
define('NONCE_SALT',       '/a&R3N2O1_8qD#j6v:;wnTSF+mP_M5Wm1$nb(_g}w7Tu4|WZJ4&1^Xk7}{?+{,_s');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

// define( 'WP_ALLOW_REPAIR', true);
