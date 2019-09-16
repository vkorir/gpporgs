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

// ** MySQL settings ** //
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
define('AUTH_KEY',         'ednZIJUhYebIl9y1aV9qy31dneZlaxmadxUEdkiBa67CAfuXSleAp53iG/CMldzlskx7pla4Qc8q1rnVJdb9pw==');
define('SECURE_AUTH_KEY',  'wjv6W4Rw4L0yCnyMq42oGfrmHGf5KpuXDdHoaUlTitwLKN1xz1BKsHt/WwYu/Esrowuzm8VisetBx2YEOCP9ag==');
define('LOGGED_IN_KEY',    'IP64ImGOoNI6KUjrsKFmbxc0Ya/UQjjdTvQBkyvutW88Irs4VLIa3x9amZ/jHCobjKVIn3zIQYvwMJQnu6kkRA==');
define('NONCE_KEY',        'XGmty4X1LLuyxvS3GVN37D0V14qwS/4AjkI+kmuWa6tCd9vBYimd9nMWt3Blvypmna3nsv6saPHTFiWLkT1jpA==');
define('AUTH_SALT',        'aKS34Y3WVDUtgtLaNbtDPIE5Xc2IVzmBzO6tEYcYkCM1GuUJr5akKmow8Vkl3YWxOF8gFaDzXwzIvrp+iDTtIQ==');
define('SECURE_AUTH_SALT', '/NSD1BURPU+9wzIi7S3csKgJdA9T8XLFkHGUAEfwi7cxVesPYNB9rsx0c12196p44vSQ//VbhGqXb5ot4lEe8g==');
define('LOGGED_IN_SALT',   '2mrNyhv/E1p1KwgioF968PmECiW+MdLrYYgd49WV2eGSyssU3X+6vpaQMzQypWFZsDCk98MWVRm2QWEcTw0PKA==');
define('NONCE_SALT',       'o1yiEqlpGWtw76wZCLHEo+r+3Qe5w45OZDHMGAUf07Kt54hbcqKd9cAmmJGob6FTviqrNxjAJIhWkfG0mGOXpw==');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
