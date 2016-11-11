Dockerized Complex Collections Object data model
================================================

You must have docker version 1.8 or higher ( check your version by running 'docker-compose -version' )

This project provides a `docker-compose` application which builds and installs the DINA-Web Collections data model from https://github.com/chicoreus/cco_poc/tree/master/src/main/resources/edu/harvard/huh/specify/datamodel/cco_full/db

It uses the `mysql` or `mariadb` database engine containers and a `cco` container to create the database schema.

# Usage

	# to build and start services:
	make

	# to connect to the database:
	make connect

	# to list tables
	make show-tables

	# to stop, remove and clean up services/resources:
	make clean

	# to make a backup of the datadir (shuts down the db engine, 
	# makes the backup, then starts it):
	make backup-datadir
	
	# to make a backup into sql format (with running system, 
	# using a single transaction):
	make backup-sqldump

# Loading data and backups

To populate the schema with data, the `Makefile` provides two targets:

	make backup-sqldump  # backs up with timestamp using mysqldump
	make restore-sqldump  # restores using latest sql dump

This means you can populate the database using your preferred method of loading data.

You can run or schedule the `make backup-sqldump` command at any time to dump the schema with data in it.

You can restore that data from any dump into a fresh instance of the database using `make restore-sqldump`, it will use the latest dump, see the `Makefile` for details.

## NB: switching database engine

To switch from mariadb to mysql, edit the `docker-compose.yml` file and uncomment the commented line that references the other image.
After running the 'make connect' you can validate the database by running commands i.e; 'show tables', 'desc taxon' 


# Tables

You can run `make show-tables` to list the tables, or use `make connect` and issue any valid command there:

	+-------------------------------+
	| Tables_in_cco                 |
	+-------------------------------+
	| DATABASECHANGELOG             |
	| DATABASECHANGELOGLOCK         |
	| accession                     |
	| accessionagent                |
	| address                       |
	| addressofrecord               |
	| agent                         |
	| agentgeography                |
	| agentlink                     |
	| agentname                     |
	| agentnumberpattern            |
	| agentreference                |
	| agentrelation                 |
	| agentspeciality               |
	| agentteam                     |
	| attachment                    |
	| attachmentencumberance        |
	| attachmentrelation            |
	| auditlog                      |
	| biologicalattribute           |
	| borrow                        |
	| catalogeditem                 |
	| catalognumberseries           |
	| catitemencumberance           |
	| codetableint                  |
	| collectingevent               |
	| collection                    |
	| collector                     |
	| coordinate                    |
	| ctageclass                    |
	| ctbiologicalattributetype     |
	| ctcoordinatetype              |
	| ctelectronicaddresstype       |
	| ctencumberancetype            |
	| ctlengthunit                  |
	| ctmassunit                    |
	| ctnumericattributetype        |
	| ctpicklistitem                |
	| ctransaction                  |
	| ctrelationshiptype            |
	| cttextattributetype           |
	| deaccession                   |
	| electronicaddress             |
	| encumberance                  |
	| eventdate                     |
	| geography                     |
	| geographytreedef              |
	| geographytreedefitem          |
	| geologictimeperiod            |
	| geologictimeperiodtreedef     |
	| geologictimeperiodtreedefitem |
	| georeference                  |
	| gift                          |
	| identifiableitem              |
	| identification                |
	| inference                     |
	| loan                          |
	| locality                      |
	| localityencumberance          |
	| materialsample                |
	| numericattribute              |
	| othernumber                   |
	| paleocontext                  |
	| picklist                      |
	| picklistitemint               |
	| preparation                   |
	| principal                     |
	| repositoryagreement           |
	| scope                         |
	| storage                       |
	| storagetreedef                |
	| storagetreedefitem            |
	| systemuser                    |
	| systemuserprincipal           |
	| taxon                         |
	| taxonencumberance             |
	| taxontreedef                  |
	| taxontreedefitem              |
	| textattribute                 |
	| transactionagent              |
	| transactionitem               |
	| unit                          |
	+-------------------------------+

# Table descriptions

Tables are described in https://github.com/chicoreus/cco_poc in https://github.com/chicoreus/cco_poc/blob/master/src/main/resources/edu/harvard/huh/specify/datamodel/cco_full/db/tables.sql
