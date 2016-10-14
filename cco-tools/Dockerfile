FROM maven:latest
WORKDIR /usr/src
COPY wait-for-it.sh .
COPY collections-data-model .
COPY pom.xml .
COPY liquibase.properties src/main/resources/edu/harvard/huh/specify/datamodel/cco_poc/db
RUN export DISPLAY=:0.0
CMD exec ./wait-for-it.sh --timeout=40 db:3306 --strict -- \
	mvn clean install
