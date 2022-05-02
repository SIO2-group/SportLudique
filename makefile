SHELL := /bin/bash
SERVER_PATH := /srv/http
ARROW := \033[1m\033[31m>\033[32m>\033[33m>\033[39m

CL_GREEN := \033[32m
CL_RESET := \033[39m
.SILENT:

.env:
	echo 'APP_ENV=dev' > .env
	echo 'APP_SECRET=15176f4509b8a40b28487e4738f79d89' >> .env
	echo 'DATABASE_URL="mysql://dev@127.0.0.1:3306/sport_ludique?serverVersion=mariadb-10.7.3"' >> .env

vendor:
	composer update

clean:
	rm -rf vendor
	rm .env
	rm .env.test

local: .env vendor
	# Start local server
	symfony server:start


prod: .env vendor
	echo -e "${ARROW} Creating production server..."

	# Overriding the ownership of every server files
	sudo chown -R $(shell whoami) /srv/http/*
	rm -rf $(SERVER_PATH)/*

	echo -e "[${CL_GREEN}OK${CL_RESET}] Server cleared"

	# Copy Symfony files
	cp -r .env $(SERVER_PATH)
	cp -r * $(SERVER_PATH)

	echo -e "[${CL_GREEN}OK${CL_RESET}] File copied"

	# modify the .env to prod mode
	sed -i 's/APP_ENV=dev/APP_ENV=prod/' $(SERVER_PATH)/.env

	echo -e "[${CL_GREEN}OK${CL_RESET}] Enabled production mode"

	# Fixing var http user permissions
	sudo chown -R http $(SERVER_PATH)/var
	sudo chmod -R u+rwx $(SERVER_PATH)/var

	echo -e "[${CL_GREEN}OK${CL_RESET}] Done! http://localhost"

.PHONY: clean local prod