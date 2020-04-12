# WordPress Installer

A simple script used to download and install WordPress and the WordPress [starter theme](https://github.com/andreinadaban/wp-theme).

## Requirements

This script requires [WP CLI](https://wp-cli.org/), [Git](https://git-scm.com/) and [OpenSSL](https://www.openssl.org/source/) to be installed.

## Installation

1. Move the `wpi.sh` file into the `/usr/local/bin` directory
2. Remove the `.sh` extension
3. Make the file executable using the `chmod +x /usr/local/bin/wpi` command

## Usage

Run `wpi site-name site-title admin-user admin-password admin-email`.