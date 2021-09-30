@echo off
setlocal

REM Adding the caps
psql -d nics -U postgres -w -c "\COPY cap FROM '%cd%\cap.sql' (DELIMITER(','))"
psql -d nics -U postgres -w -c "SELECT setval('capid_seq', max(capid)) FROM cap"

REM Adding orgcaps
psql -d nics -U postgres -w -c "INSERT INTO orgcap (orgid, capid) SELECT 1, capid From cap"

endlocal
@echo on