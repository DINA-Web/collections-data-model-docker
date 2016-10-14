include .env
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)
HOST = beta.dina-web.net
TS := $(shell date '+%Y_%m_%d_%H_%M')


all: init build up

init:
	mkdir -p mysql-datadir backups

build:
	@echo "Pulling source code for dependencies from GitHub"
	cd cco-tools && git clone https://github.com/DINA-Web/$(NAME).git
	cd cco-tools && curl -L -s -o wait-for-it.sh \
		https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
		chmod +x wait-for-it.sh
	docker-compose build cco

up: 
	@echo "Starting database and creating schema..."
	docker-compose up -d db
	docker-compose run cco

connect:
	@export $(cat .env | xargs) > /dev/null
	@echo "Connecting to db... pls enter 'show tables' at the prompt."
	docker-compose run --rm db sh -c \
		"mysql -h db -u $(MYSQL_USER) -p$(MYSQL_PASSWORD) -D $(MYSQL_DATABASE)"

backup-datadir:
	@echo "Backing up db datadir..."
	docker-compose stop db
	docker-compose run --rm backup sh -c \
		"tar cvfz /backups/db-datadir-$(TS).tgz /var/lib/mysql"
	docker-compose start db
	sudo chown $(ME):$(ME) backups/db-datadir-$(TS).tgz

backup-sqldump:
	@export $(cat .env | xargs) > /dev/null
	@echo "Backing up db using sql dump..."
	@docker-compose run --rm db sh -c \
		"mysqldump -h db -u root --single-transaction -p$(MYSQL_ROOT_PASSWORD) $(MYSQL_DATABASE)" > backups/db-dump-$(TS).sql
	@cp backups/db-dump-$(TS).sql backups/dump.sql

restore-sqldump:
	@export $(cat .env | xargs) > /dev/null
	@echo "Restoring using sql dump..."
	@docker-compose run --rm db sh -c \
		"mysql -h db -u root -p$(MYSQL_ROOT_PASSWORD) $(MYSQL_DATABASE) < backups/dump.sql"

stop:
	docker-compose stop

clean: stop rm
	@echo "Removing code and ..."
	sudo rm -rf cco-tools/$(NAME) cco-tools/wait-for-it.sh

rm:
	@echo "Removing persisted db data..."
	docker-compose rm -vf
	sudo rm -rf mysql-datadir
	sudo rm -rf backups

