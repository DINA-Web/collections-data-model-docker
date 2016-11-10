# Changes

## locally

- upgrade: use later liquibase-core and liquibase-maven-plugin to fix xml error in db.changeset-master.xml-file

various changes to use the changeset properly:

- put liquibase.propertis in src/main/resources (Dockerfile)
- put changeLogFile in that place too, so change in liquibase.properites
- change liquibase.properites file location in pom.xml
- add configuration to pom.xml to use promtOnNonLocalDatabase etc
- add caching of repository files to cco-tools mappings

# globally

There were changes required that should be made into a PR for https://github.com/chicoreus/cco_poc

- bug: namespace info in xml file... newer version of maven plugin required xmlns:ext to be defined

	<   xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
	<          http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd">

	>   xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext"
	>   xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd
	>   http://www.liquibase.org/xml/ns/dbchangelog-ext http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd">

- bug: incorrect field in optional.sql 
- fix: to remove underscores in catalognumberseries_id: "create unique index idxu_catitem_catnum_cns on catalogeditem(catalog_number, catalognumberseries_id);"

	< create unique index idxu_catitem_catnum_cns on catalogeditem(catalog_number, catalog_number_series_id);
	> create unique index idxu_catitem_catnum_cns on catalogeditem(catalog_number, catalognumberseries_id);

- bug: change in tables.sql to fix https://wildlyinaccurate.com/mysql-specified-key-was-too-long-max-key-length-is-767-bytes/
- fix: Indexes can be created that use only the leading part of column values, using col_name(length) syntax to specify an index prefix length:

	< create index idx_geog_fullname on geography(fullname);
	> create index idx_geog_fullname on geography(fullname(200));
	< create index idx_coll_name on collection(collection_name);
	> create index idx_coll_name on collection(collection_name(200));
