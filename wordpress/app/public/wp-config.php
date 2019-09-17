<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'local' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'bmdDxtsyWMndeDuKqS1L8l+bp1S0/wknrol1ejkaqGZ8pilRO5wFGvrokrs/1h5hNV+OeFnzP/9j4A1A1lXAFw==');
define('SECURE_AUTH_KEY',  '29JUJkIYEdCEUb8hqPlt8IhkDA4vDg66qkZ74VftBfK0gy+tD6HvvfQfVXFRhJ4WWxCmgPndmRtmEmqAWHcBKw==');
define('LOGGED_IN_KEY',    'gkYvyIYrjBn46ATW3gtE7VchYbhBL+zqFb74twPnPHARpTDEjUuaTdZiHBnqrBAwRNljpEjbkaGcquRP0gOj0A==');
define('NONCE_KEY',        'RBePHg7S0+1gcjpmn01gx/ra1GAT6kxA5cCzMyR9jSU24Ca4DRCKn2bVJeTWSESOBT81BPGG/kYUwA5ZF7AtNA==');
define('AUTH_SALT',        '3ZDrszcejlyR5BhhmcPSXWWF6DbJx8iWLx8z/JLarh5CTHX/Jd3blslc4eQi9WZnr6czVLr7aSE80iGfABCuYA==');
define('SECURE_AUTH_SALT', 'UYrqDHfKRNBeyrlvM3jmo+gATwNrpYJabDN0r3QmMt2N/GjTluaoqC1kmcfdwtXTiRnWdyZefjhRHaeFyirErw==');
define('LOGGED_IN_SALT',   'JJrYbbr8F1bWaE3L76lZhRzwXoN/oO0EWxIw3Di/tYZ5n3aPrQfP+BVBXN5I0DLzGJF3uzGF7lEop0iAP7ARCQ==');
define('NONCE_SALT',       'Wv7MqAzXZZDgVGJgp6HrbHYdqo4uRtyVlO2mC36kRbkmRHvuRh/mVEQZoUTLTAKAoi/uBB7lcMhuOvzfx5UyNg==');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
