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
echo "Usage: ./addFormTypeSurvey.sh <database> <dbuser> <formtypename> <surveyid>"
echo "If you leave off formtypename or surveyid arguments, you'll be shown the available choices for that argument"
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
  echo "You must specify a full FormTypeName."
  psql -c "select formtypename from formtype" $1 $2
  exit 1
fi

if [ "$4" == "" ]
then
  echo "You must specify a Survey ID."
  psql -c "select surveyid, title from survey" $1 $2
  exit 1
fi

db=$1;
formtypename=${3^^};
surveyid=$4;

psql -c "insert into formtype_survey (formtypename, surveyid) values('$formtypename', $surveyid);" $db $2