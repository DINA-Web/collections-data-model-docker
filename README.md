Dockerized Complex Collections Object data model
================================================

This project provides a `docker-compose`d application with `mysql` and `mariadb` database containers and a `cco` container which builds and installs the `cco_poc` data model, the fork from here: [Complex Collections Object liquibase project](https://github.com/Inkimar/cco_poc)

# Usage

		# to build and start services
		make

		# to connect to the database
		make connect
	
		# to clean up
		make clean

		# note: to switch to mariadb, edit the 
		# docker-compose.yml file and uncomment
		# the commented line that references 
		# the mariadb image

# Tables

1. agent                 
2. catalog_number_series 
3. cataloged_item        
4. col_transaction       
5. collecting_event      
6. event_date            
7. identifiable_item     
8. identification        
9. locality              
10. material_sample       
11. other_number          
12. preparation           
13. taxon          

# Table descriptions

## agent

Definition: a person or organization with some role related to natural science collections.

Note: Not fully specified.
 
## catalog_number_series 

Definition: A sequence of numbers of codes assigned as catalog numbers to material held in a natural science collection.

Note: This entity is not fully normalized.

## cataloged_item    

Definition: The application of a catalog number out of some catalog number series.

## col_transaction  

Definition: A record of the movement of a set of specimens in or out of a collection, e.g. loan, accession, outgoing gift, deaccession, borrow.

Note: Table is only minimally specified.

## collecting_event      

Definition: An event in which an occurrance was observed in the wild, and typically, for a natural science collection, a voucher was collected.

## event_date    

Definition: A span of time in which some event occurred.

## identifiable_item  

Definition: A component of a unit for which a scientific identification can be made.

## identification        

Definition: The application of a scientific name by some agent at some point in time to an identifiable item.
 
## locality  

Definition: A place.

Note: Table is only minimally specified. 

## material_sample

Definition: See DarwinCore.

## other_number 

Definition: A number or code associated with a specimen that is not known to be its catalog number

## preparation  

Definition: A physical artifact that could participate in a transaction, e.g. be sent in a loan.

Note: Does not specify preparation history or conservation history, additional entities are needed for these.

## taxon  

Definition: A scientific name string that may be curated to be linked to a nomeclatural act
 
## transaction_item

Definition:  The participation of a preparation in a transaction (e.g. a loan).

Note: Table is only minimally specified.

## unit

Definition: Logical unit that was collected or observed in a collecting event.

