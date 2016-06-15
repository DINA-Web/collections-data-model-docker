all: build up

up: 
	docker-compose up -d db
	sleep 10 && docker-compose run cco

build:
	docker-compose build cco

clean: stop rm

connect:
	@echo "Connecting to CCO database"
	mysql -u dina -ppassword12 -P 13306 -h 127.0.0.1 cco

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
