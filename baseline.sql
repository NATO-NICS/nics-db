-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

-- NICS SCHEMA

-- =======================
-- ===== Core Schema =====

CREATE TABLE workspace (
    workspaceid SERIAL PRIMARY KEY,
    workspacename character varying(100) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);

CREATE TABLE country (
    countryid SERIAL PRIMARY KEY,
    name VARCHAR(512) NOT NULL,
    countrycode VARCHAR(5) NOT NULL
);

CREATE TABLE org (
    orgid SERIAL PRIMARY KEY,
    name character varying(100) NOT NULL,
    county character varying(35) DEFAULT NULL::character varying,
    state character varying(200) DEFAULT NULL::character varying,
    timezone character varying(100) DEFAULT NULL::character varying,
    prefix character varying(24) NOT NULL,
    distribution character varying(1024) DEFAULT NULL::character varying,
    defaultlatitude double precision NOT NULL,
    defaultlongitude double precision NOT NULL,
    parentorgid integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    defaultlanguage character varying(32) DEFAULT NULL::character varying,
    countryid int references country(countryid),
    restrictincidents boolean default true,
    createincidentrequiresadmin boolean default false
);

CREATE TABLE org_orgtype (
    org_orgtypeid SERIAL PRIMARY KEY,
    orgid integer references org(orgid) NOT NULL,
    orgtypeid integer NOT NULL
);

CREATE TABLE "user" (
    userid SERIAL PRIMARY KEY,
    username character varying(100) NOT NULL UNIQUE,
    firstname character varying(20) DEFAULT NULL::character varying,
    lastname character varying(64) DEFAULT NULL::character varying,
    active boolean
);

CREATE TABLE user_info (
    user_id integer PRIMARY KEY REFERENCES "user"(userid),
    rank character varying(50),
    primary_mobile_phone character varying(15),
    primary_home_phone character varying(15),
    primary_email_addr character varying(320),
    home_base_name character varying(30),
    home_base_street character varying(30),
    home_base_city character varying(25),
    home_base_state character varying(15),
    home_base_zip character varying(10),
    agency character varying(30),
    approx_weight integer DEFAULT 0 NOT NULL,
    remarks character varying(60),
    creation_date_time bigint NOT NULL
);

CREATE TABLE systemrole (
    systemroleid integer PRIMARY KEY,
    rolename character varying(32) NOT NULL
);

CREATE TABLE userorg (
    userorgid SERIAL PRIMARY KEY,
    userid integer NOT NULL REFERENCES "user"(userid),
    orgid integer NOT NULL REFERENCES org(orgid),
    systemroleid integer NOT NULL REFERENCES systemrole(systemroleid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    unit character varying(128),
    rank character varying(128),
    description character varying(250),
    jobtitle character varying(128),
    defaultlanguage character varying(32) DEFAULT NULL::character varying
);

CREATE TABLE userorg_workspace (
    workspaceid integer NOT NULL REFERENCES workspace(workspaceid),
    userorgid integer NOT NULL REFERENCES userorg(userorgid),
    userorg_workspace_id SERIAL PRIMARY KEY,
    enabled boolean NOT NULL,
    defaultorg boolean
);

CREATE TABLE usersession (
    usersessionid SERIAL PRIMARY KEY,
    userorgid integer NOT NULL REFERENCES userorg(userorgid),
    sessionid character varying(128) NOT NULL,
    loggedin timestamp without time zone DEFAULT now() NOT NULL,
    loggedout timestamp without time zone DEFAULT now()
);

CREATE TABLE folder (
    folderid character varying(255) PRIMARY KEY,
    foldername character varying(256) NOT NULL,
    parentfolderid character varying(255),
    index integer,
    workspaceid integer NOT NULL REFERENCES workspace(workspaceid)
);

CREATE TABLE incident (
    incidentid SERIAL PRIMARY KEY,
    usersessionid integer REFERENCES usersession(usersessionid),
    incidentname character varying(256) NOT NULL,
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    folder character varying(50) DEFAULT ''::character varying NOT NULL,
    bounds geometry,
    lastupdate timestamp without time zone,
    workspaceid integer REFERENCES workspace(workspaceid),
    description character varying(500),
    parentincidentid integer,
    folderid character varying(255) REFERENCES folder (folderid),
    CONSTRAINT enforce_dims_bounds CHECK ((st_ndims(bounds) = 2)),
    CONSTRAINT enforce_geotype_bounds CHECK (((geometrytype(bounds) = 'POLYGON'::text) OR (bounds IS NULL))),
    CONSTRAINT enforce_srid_bounds CHECK ((st_srid(bounds) = 3857))
);

CREATE TABLE incident_folder (
    folderid varchar(255) references folder(folderid),
    incidentid integer references incident(incidentid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY (incidentid, folderid)
);

CREATE TABLE incidenttype (
    incidenttypeid SERIAL PRIMARY KEY,
    incidenttypename character varying(100) UNIQUE NOT NULL,
    defaulttype boolean
);

CREATE TABLE incident_incidenttype (
    incident_incidenttypeid SERIAL PRIMARY KEY,
    incidentid integer NOT NULL,
    incidenttypeid integer NOT NULL references incidenttype(incidenttypeid)
);

-- ===== END Core Schema =====

CREATE TABLE collabroom (
    collabroomid serial PRIMARY KEY,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    incidentid integer REFERENCES incident(incidentid),
    name character varying(64) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    bounds geometry,
    CONSTRAINT enforce_dims_bounds CHECK ((st_ndims(bounds) = 2)),
    CONSTRAINT enforce_geotype_bounds CHECK (((geometrytype(bounds) = 'POLYGON'::text) OR (bounds IS NULL))),
    CONSTRAINT enforce_srid_bounds CHECK ((st_srid(bounds) = 3857))
);

CREATE TABLE chat (
    chatid BIGSERIAL PRIMARY KEY,
    collabroomid integer NOT NULL REFERENCES collabroom(collabroomid),
    userorgid integer NOT NULL REFERENCES userorg(userorgid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    seqnum bigint,
    message text NOT NULL
);

CREATE TABLE datasourcetype (
    typename character varying(64) NOT NULL,
    datasourcetypeid SERIAL PRIMARY KEY
);

CREATE TABLE datasource (
    datasourceid character varying(255) PRIMARY KEY,
    externalurl character varying(256),
    internalurl character varying(512) NOT NULL,
    datasourcetypeid integer NOT NULL REFERENCES datasourcetype(datasourcetypeid),
    displayname character varying(256),
    username character varying(64),
    password character varying(64),
    active boolean DEFAULT true NOT NULL
);

CREATE TABLE datalayersource (
    datalayersourceid character varying(255) PRIMARY KEY,
    created timestamp without time zone DEFAULT now() NOT NULL,
    datasourceid character varying(255) NOT NULL REFERENCES datasource(datasourceid),
    imageformat character varying(64),
    layername character varying(256),
    nativeprojection character varying(64),
    refreshrate integer NOT NULL,
    stylepath character varying(128),
    tilegridset character varying(64),
    tilesize integer,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    opacity double precision,
    attributes character varying(1024),
    styleicon character varying(256)
);

CREATE TABLE datalayer (
    datalayerid character varying(255) PRIMARY KEY,
    baselayer boolean NOT NULL,
    created timestamp without time zone NOT NULL,
    datalayersourceid character varying(255) NOT NULL REFERENCES datalayersource(datalayersourceid),
    displayname character varying(256) NOT NULL,
    globalview boolean NOT NULL,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    legend character varying(256)
);

CREATE TABLE collabroomdatalayer (
    collabroomdatalayerid SERIAL PRIMARY KEY,
    collabroomid integer REFERENCES collabroom(collabroomid),
    datalayerid character varying(255) REFERENCES datalayer(datalayerid),
    enablemobile boolean default FALSE,
    collabroomopacity double precision DEFAULT 1,
    hazard varchar(2000)
);

CREATE TABLE collabroompermission (
    collabroompermissionid serial PRIMARY KEY,
    collabroomid integer REFERENCES collabroom(collabroomid),
    userid integer REFERENCES "user"(userid),
    systemroleid integer REFERENCES systemrole(systemroleid)
);

CREATE TABLE feature (
    featureid BIGSERIAL PRIMARY KEY,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    strokecolor character varying(64),
    strokewidth double precision,
    fillcolor character varying(64),
    dashstyle character varying(32),
    opacity double precision,
    rotation double precision,
    graphic character varying(256),
    graphicheight double precision,
    graphicwidth double precision,
    hasgraphic boolean,
    labelsize double precision,
    labeltext character varying(100),
    username character varying(100) NOT NULL,
    nickname character varying(32),
    topic character varying(96),
    "time" character varying(24),
    version character varying(12),
    ip character varying(15),
    seqtime bigint,
    seqnum bigint,
    lastupdate timestamp without time zone DEFAULT now() NOT NULL,
    geometry geometry,
    pointradius double precision,
    featuretype character varying(32),
    type character varying(32),
    attributes character varying(2000),
    graphicurl character varying(256),
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(geometry) = 2)),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(geometry) = 3857))
);

CREATE TABLE collabroomfeature (
    collabroomfeatureid BIGSERIAL PRIMARY KEY,
    collabroomid integer NOT NULL REFERENCES collabroom(collabroomid),
    featureid bigint NOT NULL REFERENCES feature(featureid),
    deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE contacttype (
    contacttypeid SERIAL PRIMARY KEY,
    type character varying(20) NOT NULL,
    display character varying(120) NOT NULL
);

CREATE TABLE contact (
    contactid SERIAL PRIMARY KEY,
    userid integer NOT NULL REFERENCES "user"(userid),
    contacttypeid integer NOT NULL REFERENCES contacttype(contacttypeid),
    enabled boolean DEFAULT false NOT NULL,
    value character varying(64) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    enablelogin boolean
);

CREATE TABLE currentusersession (
    currentusersessionid SERIAL PRIMARY KEY,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    userid integer NOT NULL REFERENCES "user"(userid),
    displayname character varying(64) NOT NULL,
    loggedin timestamp without time zone DEFAULT now() NOT NULL,
    lastseen timestamp without time zone DEFAULT now() NOT NULL,
    systemroleid integer NOT NULL REFERENCES systemrole(systemroleid),
    workspaceid integer REFERENCES workspace(workspaceid),
    CONSTRAINT uniquecurrentusersession_userid_workspaceid UNIQUE(userid, workspaceid)
);

CREATE TABLE datalayerfolder (
    datalayerfolderid SERIAL PRIMARY KEY,
    datalayerid character varying(255) NOT NULL REFERENCES datalayer(datalayerid),
    folderid character varying(255) NOT NULL REFERENCES folder(folderid),
    index integer NOT NULL
);

CREATE TABLE datalayerfolder_workspace (
    datalayerfolder_workspace_id SERIAL PRIMARY KEY,
    workspaceid integer NOT NULL REFERENCES workspace(workspaceid),
    datalayerfolderid integer NOT NULL REFERENCES datalayerfolder(datalayerfolderid)
);

CREATE TABLE datalayerstyle (
    datalayerstyleid SERIAL PRIMARY KEY,
    type character varying(20) NOT NULL,
    value character varying(255) NOT NULL,
    datalayerid character varying(255) NOT NULL REFERENCES datalayer(datalayerid)
);

CREATE TABLE document (
    documentid character varying(255) PRIMARY KEY,
    created timestamp without time zone DEFAULT now() NOT NULL,
    datasourceid character varying(255) REFERENCES datasource(datasourceid),
    displayname character varying(256) NOT NULL,
    filetype character varying(256) NOT NULL,
    folderid character varying(255) REFERENCES folder(folderid),
    globalview boolean NOT NULL,
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    filename character varying(256),
    description character varying
);

CREATE TABLE document_collabroom (
    document_collabroomid character varying(255) PRIMARY KEY,
    collabroomid integer NOT NULL REFERENCES collabroom(collabroomid),
    documentid character varying(255) NOT NULL REFERENCES document(documentid)
);

CREATE TABLE document_feature (
    document_featureid SERIAL PRIMARY KEY,
    documentid character varying(255) NOT NULL REFERENCES document(documentid),
    featureid bigint NOT NULL REFERENCES feature(featureid)
);

CREATE TABLE document_incident (
    document_incidentid SERIAL PRIMARY KEY,
    documentid character varying(255) NOT NULL REFERENCES document(documentid),
    incidentid integer NOT NULL REFERENCES incident(incidentid)
);

CREATE TABLE document_org (
    document_orgid SERIAL PRIMARY KEY,
    documentid character varying(255) NOT NULL REFERENCES document(documentid),
    orgid integer NOT NULL REFERENCES org(orgid)
);

CREATE TABLE document_user (
    document_userid character varying(255) PRIMARY KEY,
    documentid character varying(255) NOT NULL REFERENCES document(documentid),
    userid integer NOT NULL REFERENCES "user"(userid)
);

CREATE TABLE featurecomment (
    featurecommentid BIGSERIAL PRIMARY KEY,
    featureid bigint NOT NULL REFERENCES feature(featureid),
    comment character varying(2048) NOT NULL,
    datetime timestamp without time zone DEFAULT now() NOT NULL,
    username character varying(100) NOT NULL REFERENCES "user"(username)
);

CREATE TABLE formtype (
    formtypeid SERIAL PRIMARY KEY,
    formtypename character varying(60) unique
);

CREATE TABLE form (
    formid SERIAL PRIMARY KEY,
    collabroomid integer REFERENCES collabroom(collabroomid),
    formtypeid integer NOT NULL REFERENCES formtype(formtypeid),
    incidentid integer NOT NULL REFERENCES incident(incidentid),
    usersessionid integer NOT NULL REFERENCES usersession(usersessionid),
    seqtime bigint NOT NULL,
    seqnum bigint NOT NULL,
    message text NOT NULL,
    distributed boolean DEFAULT false,
    incidentname character varying(255)
);

CREATE TABLE incidenttype_formtype (
	incidenttype_formtype_id SERIAL PRIMARY KEY,
	incidenttypeid integer NOT NULL REFERENCES incidenttype(incidenttypeid),
	formtypeid integer NOT NULL REFERENCES formtype(formtypeid),
	unique(incidenttypeid, formtypeid)
);

CREATE TABLE gisparametertype (
    parametertypeid character varying(200) PRIMARY KEY,
    parametername character varying(64) NOT NULL
);

CREATE TABLE location (
    id BIGSERIAL PRIMARY KEY,
    user_id integer REFERENCES user_info(user_id) ON DELETE CASCADE,
    device_id character varying(250) NOT NULL,
    location geometry NOT NULL,
    accuracy double precision,
    course double precision,
    speed double precision,
    "time" bigint NOT NULL,
    CONSTRAINT enforce_dims_loc_location CHECK ((st_ndims(location) = 3)),
    CONSTRAINT enforce_geotype_loc_location CHECK ((geometrytype(location) = 'POINT'::text)),
    CONSTRAINT enforce_srid_loc_location CHECK ((st_srid(location) = 4326))
);

CREATE TABLE image (
    id BIGSERIAL PRIMARY KEY,
    location_id integer NOT NULL REFERENCES location(id) ON DELETE CASCADE ,
    incident_id integer NOT NULL REFERENCES incident(incidentid) ON DELETE CASCADE,
    url character varying(250) NOT NULL,
    fullpath character varying(250) NOT NULL
);

CREATE TABLE logtype (
    logtypeid SERIAL PRIMARY KEY,
    name character varying(20)
);

CREATE TABLE log (
    logid SERIAL PRIMARY KEY,
    logtypeid integer NOT NULL REFERENCES logtype(logtypeid),
    usersessionid integer REFERENCES usersession(usersessionid),
    message text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    status integer,
    workspaceid integer REFERENCES workspace(workspaceid)
);

CREATE TABLE orgfolder (
    orgfolderid SERIAL PRIMARY KEY,
    orgid integer NOT NULL references org(orgid),
    folderid character varying(250) NOT NULL references folder(folderid)
);

CREATE TABLE orgformtype (
    orgformtypeid SERIAL PRIMARY KEY,
    orgid integer NOT NULL references org(orgid),
    formtypeid integer NOT NULL references formtype(formtypeid)
);

CREATE TABLE orgtype (
    orgtypeid SERIAL PRIMARY KEY,
    orgtypename character varying(45) NOT NULL
);

CREATE TABLE incident_org (
    orgid integer NOT NULL REFERENCES org(orgid),
    incidentid integer NOT NULL REFERENCES incident(incidentid),
    userid integer NOT NULL REFERENCES "user"(userid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    primary key(incidentid, orgid)
);

CREATE TABLE region (
        regionid SERIAL PRIMARY KEY,
        regioncode VARCHAR (32),
        regionname VARCHAR(512),
        countryid integer REFERENCES country (countryid)
);

CREATE TABLE rootfolder (
    rootid character varying(255) PRIMARY KEY,
    folderid character varying(255) references folder(folderid),
    tabname character varying(256) NOT NULL,
    workspaceid integer references workspace(workspaceid)
);

CREATE TABLE userfeature (
    userfeatureid BIGSERIAL PRIMARY KEY,
    featureid bigint NOT NULL references feature(featureid),
    userid integer NOT NULL references "user"(userid),
    workspaceid integer references workspace(workspaceid),
    deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE cap (
	capid SERIAL PRIMARY KEY,
	name character varying(20) NOT NULL,
	description character varying(60)
);

CREATE TABLE orgcap (
	orgcapid SERIAL PRIMARY KEY,
	orgid integer NOT NULL references org(orgid),
	capid integer NOT NULL references cap(capid),
	activemobile boolean NOT NULL DEFAULT 't',
	activeweb boolean NOT NULL DEFAULT 't',
	lastupdate timestamp without time zone DEFAULT now() NOT NULL,
	CONSTRAINT uniqueorgidcapid UNIQUE(orgid, capid)
);

CREATE TABLE alert (
    alertid SERIAL PRIMARY KEY,
	message text NOT NULL,
	username varchar NOT NULL REFERENCES "user"(username),
	created timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE alertuser (
	alertuserid SERIAL PRIMARY KEY,
	alertid integer NOT NULL REFERENCES alert(alertid),
	userid integer REFERENCES "user"(userid),
	incidentid integer NOT NULL REFERENCES incident(incidentid)
);

create table datalayer_org (
	datalayer_orgid varchar PRIMARY KEY,
	datalayerid varchar NOT NULL REFERENCES datalayer(datalayerid),
	orgid integer NOT NULL REFERENCES org(orgid)
);

CREATE TABLE imagefeature (
	imageid varchar NOT NULL,
	location geometry NOT NULL,
	filename varchar NOT NULL,
    CONSTRAINT enforce_srid_bounds CHECK ((st_srid(location) = 3857))
);

CREATE TABLE org_incidenttype (
    org_incidenttypeid SERIAL PRIMARY KEY,
    orgid integer NOT NULL references org(orgid),
    incidenttypeid integer NOT NULL references incidenttype(incidenttypeid),
    defaulttype boolean DEFAULT false,
    unique(orgid, incidenttypeid)
);

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
	timestamp TIMESTAMP(0) WITH TIME ZONE NOT NULL,
	workspaceid INTEGER REFERENCES workspace(workspaceid),
	unique(deviceid, username, workspaceid)
);

select AddGeometryColumn('mobiledevicetrack', 'location', 3857, 'POINT', 3);
ALTER TABLE mobiledevicetrack ALTER COLUMN location SET NOT NULL;
create unique index on mobiledevicetrack(deviceid, username) WHERE workspaceid IS NULL;
create index on mobiledevicetrack(workspaceid);


create or replace view mobiledevicetrack_view as
	select * from (select *, mobiledevicetrackid as id, extract('epoch' from now()-mobiledevicetrack.timestamp) as
	age from mobiledevicetrack) as a where age < 14400;

create table mobiledevicetrack_log (like mobiledevicetrack);
alter table mobiledevicetrack_log drop column mobiledevicetrackid;
alter table mobiledevicetrack_log add column mobiledevicetrack_logid serial PRIMARY KEY;
create index on mobiledevicetrack_log(workspaceid);
create index on mobiledevicetrack_log(username);

CREATE OR REPLACE FUNCTION mdt_log_trigger() RETURNS trigger AS
$BODY$
BEGIN
 INSERT INTO mobiledevicetrack_log(deviceid,username,name,description,course,speed,accuracy,extendeddata,timestamp,workspaceid,location) VALUES(NEW.deviceid, NEW.username, NEW.name, NEW.description, NEW.course, NEW.speed, NEW.accuracy, NEW.extendeddata, NEW.timestamp, NEW.workspaceid, NEW.location);
 RETURN NEW;
END;
$BODY$ LANGUAGE 'plpgsql';

-- Insert MDT log trigger
CREATE TRIGGER mobiledevicetrack_log_trigger AFTER INSERT or UPDATE ON mobiledevicetrack
  FOR EACH ROW EXECUTE PROCEDURE mdt_log_trigger();


CREATE TABLE remotelogtype (
    id SMALLSERIAL PRIMARY KEY,
    name character varying(20) NOT NULL
);

CREATE TABLE remotelog (
    id BIGSERIAL PRIMARY KEY,
    type bigint NOT NULL references remotelogtype(id),
    username text,
    message text NOT NULL,
    workspaceid integer NOT NULL references workspace(workspaceid),
    usersessionid bigint NOT NULL references usersession(usersessionid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    error text NOT NULL
);

CREATE TABLE mediastream (
    msid BIGSERIAL PRIMARY KEY,
    title varchar(128) NOT NULL,
    url text NOT NULL,
    UNIQUE(title, url)
);

CREATE TABLE mediastream_workspace (
    id BIGSERIAL PRIMARY KEY,
    msid bigint NOT NULL references mediastream(msid) on delete cascade on update cascade,
    workspaceid integer NOT NULL references workspace(workspaceid)
);


CREATE TABLE survey (
    surveyid serial primary key,
    title varchar not null unique,
    survey JSON not null,
    created timestamp with time zone default now()
);

CREATE TABLE surveyhistory (
	surveyhistoryid bigserial primary key,
	surveyid integer references survey(surveyid),
	title varchar not null,
	survey json not null,
	originaldate timestamp with time zone not null,
	archiveddate timestamp with time zone not null default now()
);

CREATE TABLE formtype_survey (
     formtype_survey_id serial primary key,
     formtypename varchar not null references formtype(formtypename),
     surveyid integer not null references survey(surveyid),
     unique(formtypename, surveyid)
);

-- TODO:itft not used by surveyreport feature, should remove references to it
CREATE TABLE surveyresult (
    surveyresultid serial primary key,
    surveyid integer not null references survey(surveyid),
    userid varchar not null,
    surveyresult JSON not null,
    created timestamp with time zone default now()
);

-- Symbology Table
create table symbology (
   symbologyid serial primary key,
   name character varying(128) unique not null,
   description character varying(256) not null,
   owner character varying(100),
   listing json not null,
   created timestamp with time zone not null default now()
);

-- Org Symbology join table
create table org_symbology (
   org_symbologyid serial primary key,
   orgid integer references org(orgid),
   symbologyid integer references symbology(symbologyid),
   unique (orgid, symbologyid)
);



-- =======================
-- FUNCTIONS and TRIGGERS
-- =======================

-- orgcaps
CREATE OR REPLACE FUNCTION new_org_add_caps() RETURNS TRIGGER AS $$
DECLARE capid integer;
DECLARE srcapid integer;
BEGIN
    srcapid=(select cap.capid from cap where cap.name='SR');
	FOR capid IN SELECT cap.capid FROM cap
	LOOP
	    if capid = srcapid then
            INSERT INTO orgcap values (DEFAULT,NEW.orgid,capid,'t','t');
	    else
		    INSERT INTO orgcap values (DEFAULT,NEW.orgid,capid,'f','f');
        end if;
	END LOOP;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--CREATE OR REPLACE TRIGGER populate_caps
CREATE TRIGGER populate_caps
  AFTER INSERT
  ON org
  FOR EACH ROW
  EXECUTE PROCEDURE new_org_add_caps();

-- ===== END CAP =====

-- ===== BEGIN WORKSPACE ARCHIVE FOLDERS =====
create or replace function add_workspace_archive_folders() RETURNS TRIGGER AS $$
DECLARE uuid varchar = uuid_generate_v4();
BEGIN
    insert into folder (folderid, foldername, workspaceid) values (uuid, 'Archived', NEW.workspaceid);
    insert into rootfolder (select(uuid_generate_v4()), uuid, 'Archived', NEW.workspaceid);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

drop trigger if exists onnewworkspace on public.nics;
create trigger onnewworkspace after insert on workspace
    for each row execute procedure add_workspace_archive_folders();

-- ===== END WORKSPACE ARCHIVE FOLDERS =====

-- ===== BEGIN COPY WORKSPACE =====
CREATE OR REPLACE FUNCTION copy_datalayer_folders(old_parentfolder_id varchar, new_parentfolder_id varchar) RETURNS VOID AS '
DECLARE
   old_datalayer_folder RECORD;
BEGIN
   FOR old_datalayer_folder IN SELECT * FROM datalayerfolder where folderid=old_parentfolder_id LOOP
        INSERT INTO datalayerfolder VALUES(DEFAULT, old_datalayer_folder.datalayerid,new_parentfolder_id,old_datalayer_folder.index);
   END LOOP;
END' LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION copy_folders(old_parentfolder_id varchar, new_parentfolder_id varchar, workspaceid int) RETURNS VOID AS '
DECLARE
   old_folder RECORD;
   new_folderid varchar;
BEGIN
   FOR old_folder IN SELECT * FROM folder where parentfolderid=old_parentfolder_id LOOP
    new_folderid := (select uuid_in(md5(random()::text || now()::text)::cstring));
    INSERT INTO folder VALUES(new_folderid, old_folder.foldername,new_parentfolder_id,old_folder.index,workspaceid);
        PERFORM copy_datalayer_folders(old_folder.folderid, new_folderid);
        PERFORM copy_folders(old_folder.folderid, new_folderid, workspaceid);
   END LOOP;
END' LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION copy_new_workspace() RETURNS TRIGGER AS $update_workspace$
DECLARE
    old_rootfolder RECORD;
    old_userorg_workspace RECORD;
    rootfolderid varchar;
BEGIN
   FOR old_rootfolder IN SELECT * FROM rootfolder where workspaceid=1 LOOP
        rootfolderid := (select uuid_in(md5(random()::text || now()::text)::cstring));
    INSERT INTO folder VALUES(rootfolderid, old_rootfolder.tabname, null, 0, NEW.workspaceid);
    INSERT INTO rootfolder VALUES((select uuid_generate_v4()),rootfolderid,old_rootfolder.tabname,NEW.workspaceid);
    PERFORM copy_datalayer_folders(old_rootfolder.folderid, rootfolderid);
    PERFORM copy_folders(old_rootfolder.folderid, rootfolderid, NEW.workspaceid);
    END LOOP;

    FOR old_userorg_workspace IN SELECT * FROM userorg_workspace where workspaceid=1 LOOP
        INSERT INTO userorg_workspace VALUES(NEW.workspaceid, old_userorg_workspace.userorgid, DEFAULT, old_userorg_workspace.enabled);
    END LOOP;


  RETURN NEW;
END;
$update_workspace$ LANGUAGE plpgsql;

CREATE TRIGGER update_workspace
    AFTER INSERT on workspace
    FOR EACH ROW
    EXECUTE PROCEDURE copy_new_workspace();
-- ===== END COPY WORKSPACE =====

-- =======================
-- END FUNCTIONS and TRIGGERS
-- =======================

-- ==================
-- INDEXES
-- ==================
CREATE INDEX collabroom_gist ON collabroom USING gist (bounds);
CREATE INDEX feature_gist ON feature USING gist (geometry);
CREATE INDEX fk_chat_collabroom ON chat USING btree (collabroomid);
CREATE INDEX fk_chat_userorg ON chat USING btree (userorgid);
CREATE INDEX fk_collabstate_usersession ON feature USING btree (usersessionid);
CREATE INDEX fk_contact_contacttype ON contact USING btree (contacttypeid);
CREATE INDEX fk_contact_user ON contact USING btree (userid);
CREATE INDEX fk_current_usersession_usersession ON currentusersession USING btree (usersessionid);
CREATE INDEX fk_datalayer_usersession ON datalayer USING btree (usersessionid);
CREATE INDEX fk_datalayersource_datasource ON datalayersource USING btree (datasourceid);
CREATE INDEX fk_datalayersource_usersessionid ON datalayersource USING btree (usersessionid);
CREATE INDEX fk_form_incidentid ON form USING btree (incidentid);
CREATE INDEX fk_incident ON incident_incidenttype USING btree (incidentid);
CREATE INDEX fk_incident_usersession ON incident USING btree (usersessionid);
CREATE INDEX fk_incidenttype ON incident_incidenttype USING btree (incidenttypeid);
CREATE INDEX fk_log_logtype ON log USING btree (logtypeid);
CREATE INDEX fk_log_usersession ON log USING btree (usersessionid);
CREATE INDEX fk_org ON org_orgtype USING btree (orgid);
CREATE INDEX fk_orgtype ON org_orgtype USING btree (orgtypeid);
CREATE INDEX fk_rootfolder_folder ON rootfolder USING btree (folderid);
CREATE INDEX fk_userorg_org ON userorg USING btree (orgid);
CREATE INDEX fk_userorg_user ON userorg USING btree (userid);
CREATE INDEX fk_usersession_userorg ON usersession USING btree (userorgid);
CREATE INDEX incident_gist ON incident USING gist (bounds);
CREATE INDEX incidentid ON collabroom USING btree (incidentid);
CREATE UNIQUE INDEX uname_idx ON "user" USING btree (username);
