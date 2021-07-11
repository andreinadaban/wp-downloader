# WordPress Installer

A simple script used to download and install WordPress.

## Requirements

This script requires [WP CLI](https://wp-cli.org/) and [OpenSSL](https://www.openssl.org/source/).

## Installation

1. Move the `wpi.sh` file into the `/usr/local/bin` directory
2. Remove the `.sh` extension
3. Make the file executable using the `chmod +x /usr/local/bin/wpi` command

You can do all of the above with this command: `mv wpi.sh /usr/local/bin/wpi; chmod +x /usr/local/bin/wpi`.

## Usage

Run `wpi site-name site-title admin-user admin-password admin-email`.
