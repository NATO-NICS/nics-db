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
  echo "You must specify a database name to prepend to the data databases."
  exit 1
fi

if [ "$2" == "" ]
then
  echo "You must specify a username name to create and populate."
  exit 1
fi

if [ "$3" == "" ]
then
  echo "You must specify an organization's id."
  exit 1
fi

if [ "$4" == "" ]
then
  echo "You must specify a workspace id"
  exit 1
fi

# create the default user
psql -c "INSERT INTO \"user\" VALUES (DEFAULT, '$2', 'Default', 'User', true)" $1
psql -c "INSERT INTO userorg VALUES (DEFAULT, (select userid from \"user\" where username='$2'), '$3', (select systemroleid from systemrole where rolename='super'), now(), NULL, '', '', '')" $1
psql -c "INSERT INTO userorg_workspace VALUES ($4, (select userorgid from userorg order by created desc limit 1), DEFAULT, 't')" $1

# Add default usersession for this default user. Required for other scripts where a usersessionid is required before 
# the system has been used.
psql -c "INSERT INTO usersession values(DEFAULT, (select userorgid from userorg order by created desc limit 1), 'default-session-id', now(), now())" $1
