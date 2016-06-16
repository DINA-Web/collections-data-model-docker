all: init build up


init:
	@echo "Pulling code from GitHub"
	cd cco-tools && git clone https://github.com/Inkimar/cco_poc.git

build:
	docker-compose build cco

up: 
	@echo "Sorry for the 30s below, please fix it with a PR ;)"
	docker-compose up -d db
	sleep 30 && docker-compose run cco

connect:
	@echo "Connecting to CCO database and display the tables"
	mysql -u dina -ppassword12 -P 13306 -h 127.0.0.1 cco -e "show tables"

stop:
	docker-compose stop

clean: stop rm
	sudo rm -rf cco-tools/cco_poc

rm:
	docker-compose rm -vf
