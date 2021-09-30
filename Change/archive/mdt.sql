-- MobileDeviceTrack table
create table mobiledevicetrack (
	mobiledevicetrackid SERIAL PRIMARY KEY,
	deviceid VARCHAR(256) NOT NULL,
	username VARCHAR(256) NOT NULL,
	name VARCHAR(128),
	description VARCHAR(256),
	course DOUBLE PRECISION,
	speed DOUBLE PRECISION,
	accuracy DOUBLE PRECISION,
	extendeddata varchar(512),
	timestamp TIMESTAMP(0) WITH TIME ZONE NOT NULL, --timezone(0) to keep compatibility with old mobile clients
	workspaceid INTEGER,
	unique(deviceid, username, workspaceid)
);

select AddGeometryColumn('mobiledevicetrack', 'location', 3857, 'POINT', 3);
ALTER TABLE mobiledevicetrack ALTER COLUMN location SET NOT NULL;

create unique index on mobiledevicetrack(deviceid, username) WHERE workspaceid IS NULL;
create index on mobiledevicetrack(workspaceid);

grant all privileges on table mobiledevicetrack to public;
grant all privileges on table mobiledevicetrack_mobiledevicetrackid_seq to public;


-- Age filtered view for mdt table
-- Note: old mobile clients require an 'id' field in the properties
create or replace view mobiledevicetrack_view as
	select * from (select *, mobiledevicetrackid as id, extract('epoch' from now()-mobiledevicetrack.timestamp) as age from mobiledevicetrack) as a where age < 14400;

grant all privileges on table mobiledevicetrack_view to public;

--Create the log table, based on the mobiledevicetrack table
create table mobiledevicetrack_log (like mobiledevicetrack);
alter table mobiledevicetrack_log drop column mobiledevicetrackid;
alter table mobiledevicetrack_log add column mobiledevicetrack_logid serial PRIMARY KEY;
create index on mobiledevicetrack_log(workspaceid);
create index on mobiledevicetrack_log(username);
grant all privileges on table mobiledevicetrack_log to public;
grant all privileges on table mobiledevicetrack_log_mobiledevicetrack_logid_seq to public;

-- Insert trigger for log table
CREATE OR REPLACE FUNCTION mdt_log_trigger() RETURNS trigger AS
$BODY$
BEGIN
 INSERT INTO mobiledevicetrack_log(deviceid,username,name,description,course,speed,accuracy,extendeddata,timestamp,workspaceid,location) VALUES(NEW.deviceid, NEW.username, NEW.name, NEW.description, NEW.course, NEW.speed, NEW.accuracy, NEW.extendeddata, NEW.timestamp, NEW.workspaceid, NEW.location);
 RETURN NEW;
END;
$BODY$ LANGUAGE 'plpgsql';

-- Insert log trigger
CREATE TRIGGER mobiledevicetrack_log_trigger AFTER INSERT or UPDATE ON mobiledevicetrack
  FOR EACH ROW EXECUTE PROCEDURE mdt_log_trigger();
