FROM maven:latest
WORKDIR /usr/src
COPY cco_poc .
COPY pom.xml .
COPY liquibase.properties src/main/resources/edu/harvard/huh/specify/datamodel/cco_poc/db
RUN export DISPLAY=:0.0
CMD ["mvn", "clean", "install"]
