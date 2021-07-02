NAME_APACHE = dev_wordpress_webserver
NAME_MYSQL = dev_wordpress_dbserver

RUN_APACHE = docker exec -it --user www-data $(NAME_APACHE) /bin/bash
RUN_MYSQL = docker exec -i -t $(NAME_MYSQL) /bin/bash

build:
	docker-compose build
	
up:
	mkdir www -p
	docker-compose up -d

stop:
	docker-compose stop
		
down:
	docker-compose down

login:
	$(RUN_APACHE)

dblogin:
	$(RUN_MYSQL)

fullreset:
	rm -f www/ -R
	docker volume rm $(NAME_DB_VOLUME) | true
	docker-compose build
	
resetdb:
	docker volume rm $(NAME_DB_VOLUME) | true