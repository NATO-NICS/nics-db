@echo off
setlocal
REM
REM (c) Copyright, 2015 Ardent Management Consulting, All Rights Reserved
REM
REM     This material may be reproduced by or for the
REM     U.S. Government pursuant to the copyright license
REM     under the clause at DFARS 252.227-7013 (June, 1995).
REM

REM Adding the Changes
psql -d nics -U postgres -w -f 6_2.sql

if %ERRORLEVEL% == 0 (
	echo  6.2 Changes Added Successfully. > CON
	echo. > CON
)

call add_datasourceImport.bat %fqdn%

if %ERRORLEVEL% == 0 (
	echo. > CON
	echo  Added Datasources Successfully. > CON
	echo. > CON
)

psql -d nics -U postgres -w -f 6_4.sql

if %ERRORLEVEL% == 0 (
	echo  6.4 Changes Added Successfully. > CON
	echo. > CON
)

call addCap.bat

if %ERRORLEVEL% == 0 (
	echo  Org Capabilties Added Successfully. > CON
	echo. > CON
)
endlocal
@echo on