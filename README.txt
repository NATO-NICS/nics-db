====
	Copyright (c) 2008-${year}, Massachusetts Institute of Technology (MIT)
	All rights reserved.

	Redistribution and use in source and binary forms, with or without 
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright notice, this 
	list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright notice, 
	this list of conditions and the following disclaimer in the documentation 
	and/or other materials provided with the distribution.

	3. Neither the name of the copyright holder nor the names of its contributors 
	may be used to endorse or promote products derived from this software without 
	specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE 
	FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
	DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
	OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
====

NICS Database Setup
====================

There are 2 main scripts to note, along with the sql files they import:

- create_db.sh: A script file that can be executed to create the database as of a certain version. This script 
	should be updated for each release to include any incremental change SQL script file that is required for the 
	corresponding NICS version. The incremental change scripts should go into the 'changes' directory.

- create_data_dbs.sh: A script file that can be executed to create the shapefiles database:
	- nics_shapefiles

- baseline.sql: Specifies the baseline schema. This is as of NICS 6.0.

- baseline_data.sql: Specifies the baseline data for the NICS database.

Executing the 'create_db.sh' requires that database name and username parameters are passed in
	(e.g. "./create_db.sh integration nics"). The script will create the database with the 
	specified name, create the baseline schema for that database, insert the baseline data for that database, 
	and will execute any of the SQL change scripts (as long as they have been added to the 'create_db.sh' script file).
	
Executing the 'create_data_dbs.sh' script requires a database name parameter (e.g. "./create_data_dbs.sh nics"). This 
	parameter is used as a prefix for the data databases, e.g., nics_shapefiles. This script also
	creates the default schema for the MDT table as required for using the Mobile Device Tracking functionality of NICS.


NICS System Setup
====================

There are 5 scripts that will help to set up a basic system

- /scripts/create_workspace.sh:
	(1) Database to create workspace on
	(2) A unique workspace ID - recommend starting with 1
	(3) A workspace name - this will appear as a button on the main page, for example "Incident"

- /scripts/create_org.sh:
	(1) Database to create org on
	(2) Name of the organization
	(3) County
	(4) State
	(5) Prefix
	(6) The orgtype ID - this will allow users to register with this organization. The IDs can be found in the orgtype table

- /scripts/create_default_user.sh: The password is set to TestPassword1!
	(1) Username
	(2) Organization Id (query org table)
	(3) Workspace Id (query workspace table)

- /scripts/create_default_folders.sh: Creates folders Maps, Data, Tracking, Weather, and Uploads for specified workspace.	
	(1) Name of database
	(2) Workspace ID to create folders under
	
These 2 scripts will add base layers and weather layers

	- /datalayers/maps/maps_layers.sh - NOTE: Places the layers in Workspace 1
		(1) Database to create layers on		

	- /datalayers/weather/weather_layers.sh
		(1) Database to create layers on
		(2) Workspace ID to place the layers in
		
		
