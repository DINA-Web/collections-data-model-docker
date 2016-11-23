--liquibase formatted sql

--changeset ronquist:1

-- Change taxon_id in table identification to reference taxonomy module
ALTER TABLE identification
MODIFY COLUMN taxon_id varchar(900) not null -- reference to taxon (name usage) in taxonomy module in the format URI + UUID

-- Drop table taxon
DROP TABLE taxon

DELETE FROM ctpicklistitem WHERE picklist_id = 5000
DELETE FROM ctpicklistitem WHERE picklist_id = 5001
DELETE FROM picklist WHERE table_name = 'taxon'

-- Do we need to drop this? -- create index idx_taxon_acceptaxonid on taxon (accepted_taxon_id); 
-- Do we need to drop this? -- alter table taxon add constraint fk_taxon_acceptedid foreign key (accepted_taxon_id) references taxon (taxon_id) on update cascade;
-- Do we need to drop this? -- alter table taxon add constraint fk_taxon_parentid foreign key (parent_id) references taxon (taxon_id) on update cascade;

-- Drop table taxontreedef
DROP TABLE taxontreedef

-- Drop table taxontreedefitem
DROP TABLE taxontreedefitem

DELETE FROM ctpicklistitem WHERE picklist_id = 5005
DELETE FROM picklist WHERE table_name = 'taxontreedefitem'

-- ?? alter table taxontreedefitem add constraint fk_ttdefitem_ttreedef foreign key (taxontreedef_id) references taxontreedef (taxontreedef_id) on update cascade;

-- ?? alter table taxon add constraint fk_taxon_ttdefitem_id foreign key (taxontreedefitem_id)  references taxontreedefitem (taxontreedefitem_id) on update cascade;

-- ?? ALTER TABLE identification add constraint fk_idtaxon foreign key (taxon_id) references taxon (taxon_id) on update cascade;
-- ?? ALTER TABLE taxon add constraint fk_idparent foreign key (parent_id) references taxon (taxon_id) on update cascade;
-- ?? ALTER TABLE taxon add constraint fk_idaccepted foreign key (accepted_taxon_id) references taxon (taxon_id) on update cascade;

