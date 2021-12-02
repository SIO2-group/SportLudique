# INSTALLATION

## dev

## Required environment

- `php` **^7.3**

- `composer` The php library manager,
  If you don't have composer, download it from
  `https://getcomposer.org/download/`

- `yarn` The js package manager,
  if you don't have yarn but npm, do `npm install -g yarn`
  otherwise, install it from `https://classic.yarnpkg.com/lang/en/docs/install`

- `mysql` **^5.7 | ^8.0** 

### Optional environment
- `apache` **^2.4.47**

### setup

1. Install dependencies
```sh
composer install
```

```sh
yarn install
```

2. Running Encore

```sh 
encore dev --watch
```

3. Adding dotenv config
- create a `.env` file with the database configuration
- create the schema in your database if needed

4. run the migrations
```sh
php bin/console doctrine:migrations:migrate
```

6. Starting the server
```sh
symfony server:start
```

## prod
<!-- TODO: Add prod instructions -->
