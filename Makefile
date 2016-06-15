all: build up

up: 
	docker-compose up -d cco-mysql

build:
	docker-compose build cco-tools

clean: stop rm

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
