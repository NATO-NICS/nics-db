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



set -e;

if [ "$1" == "" ]
then
  echo "You must specify a database to create the folders in."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a workspace id that these folders will be created under."
  exit 1
fi

# If uuidgen isn't available on your system, then you'll have to manually fill in these values each run.
# You can also get them in psql by performing the following:
# 	1) psql> create extension if not exists "uuid-ossp";
#   2) psql> select uuid_generate_v4();
#
MAPS=$(uuidgen);
DATA=$(uuidgen);
WEATHER=$(uuidgen);
TRACKING=$(uuidgen);
UPLOAD=$(uuidgen);

# For workspace 1, the Incident workspace
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('$MAPS','Maps',$2)" $1
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('$DATA','Data',$2)" $1
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('$WEATHER','Weather',$2)" $1
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('$TRACKING','Tracking',$2)" $1
psql -c "INSERT INTO folder(folderid,foldername,parentfolderid,index,workspaceid) VALUES ('$UPLOAD','Upload','$DATA',0,$2)" $1

psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES ((select uuid_generate_v4()),'$MAPS','Maps',$2)" $1
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES ((select uuid_generate_v4()),'$DATA','Data',$2)" $1
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES ((select uuid_generate_v4()),'$WEATHER','Weather',$2)" $1
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES ((select uuid_generate_v4()),'$TRACKING','Tracking',$2)" $1
