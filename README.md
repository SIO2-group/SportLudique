# INSTALLATION *for production server*

## Required environment

- `php` **^7.3**

- `composer` The php library manager.\
  If you don't have composer, download it from
  [https://getcomposer.org/download/](https://getcomposer.org/download/)
- `sass` **^1.49** A style preprocessor.\
   If you don't have sass, download it from
  [https://sass-lang.com/install](https://sass-lang.com/install)
- `mariadb` **^10.7**
### Optional environment
- `apache` **^2.4.47**

## Windows

1. Install dependencies
```sh
composer install
```

2. Compile style file
```sh
sass $SERVER_PATH/public/scss/style.scss $SERVER_PATH/public/css/style.css
```

3. Adding dotenv config
- Create the schema in your database if needed
- Create a `.env` based on the template below 
  - Replace `$secret` by the APP_SECRET generated
  - Replace `$user` by the root user
  - Replace `$password` by the user password
  - Replace `$ip` by the ip web server
  - Replace `$dbname` by the SportLudique database name
  - Replace `$serverVersion` by the mariadb server version

```sh
APP_ENV=prod
APP_SECRET=$secret
DATABASE_URL="mysql://$user:$password@$ip/$dbname?serverVersion=mariadb-$serverVersion"
```

## Linux
1. Replace `SERVER_PATH` by the right path of the web server in the `makefile`
```
SERVER_PATH := /srv/http
```
2. Use makefile
```sh
make prod
```