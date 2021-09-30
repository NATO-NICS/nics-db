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

psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('f673e108-7ca0-4907-8b62-ebf3d56e91f6','Data',1)" nics
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('C6659C73-3BF2-4F7F-90AD-7EEFE9D4EEBA','Maps',1)" nics
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('371D4DE7-10BC-462B-81C2-4199C332BBEF','Weather',1)" nics
psql -c "INSERT INTO folder(folderid,foldername,workspaceid) VALUES ('3103D8FC-990F-4EF1-9D0E-F3490A05A0EB','Tracking',1)" nics
psql -c "INSERT INTO folder(folderid,foldername,parentfolderid,index,workspaceid) VALUES ('2088F0E0-3B8E-4715-92AA-59DE29C8516B','Upload','f673e108-7ca0-4907-8b62-ebf3d56e91f6',0,1)" nics

psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES (1,'C6659C73-3BF2-4F7F-90AD-7EEFE9D4EEBA','Maps',1)" nics
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES (2,'f673e108-7ca0-4907-8b62-ebf3d56e91f6','Data',1)" nics
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES (3,'371D4DE7-10BC-462B-81C2-4199C332BBEF','Weather',1)" nics
psql -c "INSERT INTO rootfolder(rootid,folderid,tabname,workspaceid) VALUES (4,'3103D8FC-990F-4EF1-9D0E-F3490A05A0EB','Tracking',1)" nics

psql -c "INSERT INTO datalayersource(created, datalayersourceid,datasourceid,refreshrate,usersessionid) VALUES (now(),'0b79bd02-bf28-494d-aa2f-f2ce858d9db8','AAAAAAA-AD76-439D-BEB5-C019EB6553A1',0,1)" nics
psql -c "INSERT INTO datalayersource(created,datalayersourceid,datasourceid,refreshrate,usersessionid) VALUES (now(),'62352220-c0f9-4652-a412-28e6b2fdaa95','AAAAAAA-AD76-439D-BEB5-C019EB6553A1',0,1)" nics

psql -c "INSERT INTO datalayer(usersessionid,created,datalayerid,baselayer,datalayersourceid,displayname,globalview) VALUES (1,now(),'c09cc1e1-1d69-4b49-9f30-683d55213ed6','t','0b79bd02-bf28-494d-aa2f-f2ce858d9db8','Data Legend','t')" nics
psql -c "INSERT INTO datalayer(usersessionid,created,datalayerid,baselayer,datalayersourceid,displayname,globalview) VALUES (1,now(),'16d3c7e8-dfa4-42aa-a25e-4c9dd01a0a75','t','62352220-c0f9-4652-a412-28e6b2fdaa95','Weather Legend','t')" nics


psql -c "INSERT INTO datalayerfolder(datalayerfolderid,datalayerid,folderid,index) VALUES (10,'16d3c7e8-dfa4-42aa-a25e-4c9dd01a0a75','371D4DE7-10BC-462B-81C2-4199C332BBEF',0)" nics
psql -c "INSERT INTO datalayerfolder(datalayerfolderid,datalayerid,folderid,index) VALUES (11,'c09cc1e1-1d69-4b49-9f30-683d55213ed6','f673e108-7ca0-4907-8b62-ebf3d56e91f6',0)" nics

