@echo off
setlocal

if "%~1" == "" (
  echo ERROR: First argument must specify the server FQDN.
  call :PRINTUSAGE
  exit /B 1
)

REM add the missing type
psql -d nics -U postgres -w -c "INSERT INTO datasourcetype VALUES ('image', 16)"
psql -d nics -U postgres -w -c "INSERT INTO datasourcetype VALUES ('shapefiles', 17)"

set url=http://%1/upload/
set geourl=http://%1/geoserver/nics.images/wfs

echo URL "%url%"

REM add the layers
psql -d nics -U postgres -w -c "INSERT INTO datasource (datasourceid, datasourcetypeid, externalurl, internalurl, displayname) VALUES('AAAAAAAA-AD76-439D-BEB5-C019EB6553A2',2,'','%url%kml/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB6553A3',3,'','%url%wmts/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB6553A4',4,'','%url%kmz/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB6553A6',6,'','%url%georss/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB6553A8',8,'','%url%xyz/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655310',10,'','%url%google/',''),('AAAAAAAA-ADa76-439D-BEB5-C019EB655311',11,'','%url%document/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655312',12,'','%url%arcgiscache/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655313',13,'','%url%gpx/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655314',14,'','%url%bing/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655315',15,'','%url%geojson/',''),('AAAAAAAA-AD76-439D-BEB5-C019EB655317',7,'','%url%shapefiles/','')"

psql -d nics -U postgres -w -c "INSERT INTO datasource (datasourceid, datasourcetypeid, externalurl, internalurl, displayname)VALUES('AAAAAAAA-AD76-439D-BEB5-C019EB655316',16,'','%geourl%','')"

exit /B 0

:PRINTUSAGE
echo USAGE: add_datasourceImport.bat FQDN
GOTO :eof

endlocal
@echo on