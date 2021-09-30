## Synopsis

Scripts for building the NICS database

## Installation

 - Requires postgis 2.1

 - The create_db.sh script will build and populate the nics database with default values

 - In the scripts directory there are scripts to help create workspaces, organizations and users

 - The datalayers directory contains scripts that will populate the database with base maps and weather layers that leverage the NOAA Weather feed

 - For each type of datalayer import, you must add the relevant information to the data source table.  For example, to get KML imports to work you would need the following row in DataSource:
 'randomsourceid' '' '<fqdn>/upload/<PATH_TO_KML_DIR>/' 2 <display_Name> \N \N

## Documentation

Further documentation is available at nics-common/docs
