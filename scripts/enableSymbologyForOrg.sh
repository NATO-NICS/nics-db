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

echo "Enable Symbology"
echo ""
echo

if [ "$1" == "" ]
then
  echo "You must specify a database to use. Usually 'nics'."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a database user to run the schema updates with. Usually 'nics'."
  exit 1
fi



if [ "$3" == "-np" ]
then
  psql -c "insert into org_symbology (orgid, symbologyid) values($4, $5);" $1 $2
  exit 0
fi


ORGID='';

psql -c "select orgid, name from org" $1 $2

echo -n "Please enter an OrgID: ";
read ORGID;

if [ "$ORGID" == "" ]
then
  echo "You didn't enter a value. Exiting.";
  exit 1
fi

echo "Symbology to choose from:";

psql -c "select symbologyid, name, description from symbology" $1 $2

echo -n "Symbology ID to enable: "
read SYMBOLOGYID;

if [ "$SYMBOLOGYID" == "" ]
then
  echo "You didn't choose a Symbology option. Exiting.";
fi

echo "You entered org $ORGID and symbology $SYMBOLOGYID";

psql -c "insert into org_symbology (orgid, symbologyid) values($ORGID, $SYMBOLOGYID);" $1 $2






exit
