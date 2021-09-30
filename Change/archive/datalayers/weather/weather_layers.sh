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

if [ "$1" == "" ]
then
  echo "You must specify a database name to create and populate."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a workspaceid to place the layer folders under."
  exit 1
fi

# now create weather layers

# Old weather_folders.sql content
#E1F8E910-B773-4317-A4DF-DD6E0D50EDCD	Near Real-Time Surface Analysis	371D4DE7-10BC-462B-81C2-4199C332BBEF	1	1
#F6C59F73-5F3E-4E43-BBC4-3586A9C4DFCC	Near Real-Time Observations	371D4DE7-10BC-462B-81C2-4199C332BBEF	2	1
#FB9ABF2F-98C0-41C3-8C16-8324E1E701B9	Warnings	371D4DE7-10BC-462B-81C2-4199C332BBEF	0	1
#BFCC7A88-6625-4731-9713-A87102DC0EA5	Surface Forecasts	371D4DE7-10BC-462B-81C2-4199C332BBEF	3	1


# Weather Folders - these 4 lines are replacing the weather_folders.sql content
psql -c "insert into folder values('E1F8E910-B773-4317-A4DF-DD6E0D50EDCD','Near Real-Time Surface Analysis', (select folderid from folder where foldername='Weather' and workspaceid=$2), 1, $2)" $1
psql -c "insert into folder values('F6C59F73-5F3E-4E43-BBC4-3586A9C4DFCC','Near Real-Time Observations', (select folderid from folder where foldername='Weather' and workspaceid=$2), 2, $2)" $1
psql -c "insert into folder values('FB9ABF2F-98C0-41C3-8C16-8324E1E701B9','Warnings', (select folderid from folder where foldername='Weather' and workspaceid=$2), 0, $2)" $1
psql -c "insert into folder values('BFCC7A88-6625-4731-9713-A87102DC0EA5','Surface Forecasts', (select folderid from folder where foldername='Weather' and workspaceid=$2), 3, $2)" $1


psql -c "COPY datasource FROM '${PWD}/weather_datasource.sql'" $1
psql -c "COPY datalayersource FROM '${PWD}/weather_datalayersource.sql'" $1
psql -c "COPY datalayer FROM '${PWD}/weather_datalayer.sql'" $1
psql -c "COPY datalayerfolder FROM '${PWD}/weather_datalayerfolder.sql'" $1

