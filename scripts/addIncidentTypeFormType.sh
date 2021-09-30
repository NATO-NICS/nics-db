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

echo ""
echo "Usage: ./addIncidentTypeFormType.sh <database> <dbuser> '<Full Incident Type Name>' <formtypename>"
echo "If you leave off incidenttypename or formtypename arguments, you'll be shown the available choices for that argument"
echo ""

if [ "$1" == "" ]
then
  echo "You must specify a database name."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a db user."
  exit 1
fi

if [ "$3" == "" ]
then
  echo "You must specify a full Incident Type Name."
  psql -c "select incidenttypename from incidenttype" $1 $2
  exit 1
fi

if [ "$4" == "" ]
then
  echo "You must specify a FormTypeName. Remember to quote it if there are spaces."
  psql -c "select formtypename from formtype" $1 $2
  exit 1
fi

db=$1;
incidentTypeName=$3;
formtypename=$4;

psql -c "insert into incidenttype_formtype (incidenttypeid, formtypeid) values((select incidenttypeid from incidenttype where incidenttypename='$incidentTypeName'), (select formtypeid from formtype where formtypename='$formtypename'));" $db $2

