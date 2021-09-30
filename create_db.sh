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
  echo "You must specify a database name to create and populate."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a database user to create the schema with."
  exit 1
fi


# create the database
psql -c "create database $1"

# check postgis extensions
psql -c "CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;" -d "$1"
psql -c "COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language'" -d "$1"
psql -c "CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;" -d "$1"
psql -c "COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions'" -d "$1"
psql -c "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\" WITH SCHEMA public;" -d "$1"

# now create baseline schema and insert baseline data
psql -f baseline.sql "$1" "$2"

echo "If you plan on importing data from a pre-7.0.6 database export, then you should skip this";
echo "step. Otherwise your imported data IDs won't match the baseline data that this next step";
echo "generates. Only import baseline data if you DO NOT plan on importing any old data.";
  echo "Importing baseline data...";
  psql -f baseline_data.sql "$1" "$2"

# now execute incremental change scripts with:
# psql -f <script_name> "$1"

