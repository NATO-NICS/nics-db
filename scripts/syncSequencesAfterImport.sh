#!/bin/bash
#
# Copyright (c) 2008-2021, Massachusetts Institute of Technology (MIT)
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# This script loops through the specified tables, and updates the sequence associated with that table
# to be one higher than the current highest id value.
#
# This is used when you've imported data from a pre-2020 database refactor dataset, and after you've imported,
# all the sequences need synced to be higher than the highest id in the copied data.

set -e;

if [ "$1" == "" ]
then
  echo "You must specify a database name to act on."
  exit 1
fi


# Array of tables with numerical sequences to update
declare -a NICSTABLES=("workspace" "country" "org" "org_orgtype" "\"user\"" "systemrole" "userorg" "userorg_workspace"	"usersession"	"incident" "incidenttype" "incident_incidenttype" "collabroom" "chat" "datasourcetype" "collabroomdatalayer" "collabroompermission" "feature" "collabroomfeature" "contacttype" "contact"	"currentusersession"	"datalayerfolder" "datalayerfolder_workspace" "datalayerstyle" "document_feature" "featurecomment" "formtype" "form" "location" "image" "logtype" "log"
			"orgfolder" "orgformtype" "orgtype" "region" "userfeature" "cap" "orgcap" "alert"	"alertuser" "org_incidenttype" "mobiledevicetrack" "mobiledevicetrack_log" "remotelogtype" "remotelog");

# Array of tables either w/o sequences, or with varchar sequences. For housekeeping, not used in script
declare -a NICSTABLES_EXCLUDED=("folder" "datasource" "datalayersource" "datalayer" "document" "document_collabroom" "gisparametertype" "ics_position" "incident_org" "rootfolder" "user_info_ics_position" "datalayer_org" "imagefeature" "user_info" "document_incident" "document_org" "document_user");

tableid="";
# Iterate over all tables specified
for nicstable in ${NICSTABLES[@]}; do
   echo "Executing for table ${nicstable}...";
   # TODO: Do these scripts in a more useable language

   # Set default id based on table name
   tableid="${nicstable}id";

   # Handle special cases
   if [ "$nicstable" = "\"user\"" ]; then
      tableid="userid";
   fi;

   if [ "$nicstable" = "userorg_workspace" ]; then
      tableid="userorg_workspace_id";
   fi;

   if [ "$nicstable" = "datalayerfolder_workspace" ]; then
      tableid="datalayerfolder_workspace_id";
   fi;

   if [ "$nicstable" = "location" ] || [ "$nicstable" = "image" ] || [ "$nicstable" = "remotelog" ] || [ "$nicstable" = "remotelogtype" ]; then
      tableid="id";
   fi;


   psql -c "select setval( (select pg_get_serial_sequence('$nicstable', '${tableid}') as seq), coalesce((select max(${tableid})+1 from $nicstable), 1), true);" $1 || continue;
   #echo "select setval( (select pg_get_serial_sequence('$nicstable', '${tableid}') as seq), coalesce((select max(${tableid})+1 from $nicstable), 1), true);"
done