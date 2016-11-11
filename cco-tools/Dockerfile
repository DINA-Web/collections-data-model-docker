FROM maven:latest
WORKDIR /usr/src
COPY wait-for-it.sh .
COPY collections-data-model .
COPY pom.xml .

# these overrides should be fed to chicoreus as a PR and then deleted from here
COPY liquibase.properties src/main/resources
COPY db.changelog-master.xml src/main/resources/db.changelog-master.xml
COPY optional.sql src/main/resources/edu/harvard/huh/specify/datamodel/cco_full/db/optional.sql
COPY tables.sql src/main/resources/edu/harvard/huh/specify/datamodel/cco_full/db/tables.sql

RUN export DISPLAY=:0.0
CMD exec ./wait-for-it.sh --timeout=40 db:3306 --strict -- \
	mvn clean install
