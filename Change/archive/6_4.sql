SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

/*------------------------------------------------------------------*/
/*----- Adding Missing Tables with their sequences (if needed) -----*/
/*------------------------------------------------------------------*/



/** Alter **/
AlTER TABLE image add column fullpath character varying(250) NOT NULL;
ALTER TABLE orgfolder ADD PRIMARY KEY(orgfolderid);
ALTER TABLE system_workspace ADD PRIMARY KEY(system_workspace_id);

ALTER TABLE feature
ADD graphicurl character varying(256);

ALTER TABLE feature
ADD the_geom geometry;

/*-- orgcap + seq --*/

CREATE TABLE orgcap (
    orgcapid integer NOT NULL,
    orgId integer NOT NULL,
    capid integer NOT NULL,
    activeweb boolean DEFAULT true NOT NULL,
    activemobile boolean DEFAULT false NOT NULL,
    lastupdate timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY(orgcapid)
);

ALTER TABLE orgcap OWNER TO nics;


CREATE SEQUENCE org_cap_seq
        START WITH 1
        INCREMENT BY 1
        NO MINVALUE
        NO MAXVALUE
        CACHE 1;


ALTER SEQUENCE org_cap_seq OWNER TO nics;

ALTER TABLE orgcap ALTER COLUMN orgcapid SET DEFAULT nextval('org_cap_seq');
ALTER TABLE orgcap ALTER COLUMN orgcapid SET NOT NULL;
ALTER SEQUENCE org_cap_seq OWNED BY orgcap.orgcapid;

/*-- cap + seq --*/
CREATE TABLE cap (
    capid integer NOT NULL,
    name character varying(15),
    description character varying(60),
    PRIMARY KEY(capid)
);

ALTER TABLE cap OWNER TO nics;

CREATE SEQUENCE capid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE capid_seq OWNER TO nics;

ALTER SEQUENCE capid_seq OWNED BY cap.capid;

ALTER TABLE ONLY cap ALTER COLUMN capid SET DEFAULT nextval('capid_seq'::regclass);

/*-- datalayer_org --*/
CREATE TABLE datalayer_org (
    datalayer_orgid character varying(255) NOT NULL,
    datalayerid character varying(255) NOT NULL,
    orgId integer NOT NULL,
    PRIMARY KEY(datalayer_orgid)
);

ALTER TABLE datalayer_org OWNER TO nics;

CREATE SEQUENCE datalayer_orgid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE datalayer_orgid_seq OWNER TO nics;

ALTER SEQUENCE datalayer_orgid_seq OWNED BY datalayer_org.datalayer_orgid;

ALTER TABLE ONLY datalayer_org ALTER COLUMN datalayer_orgid SET DEFAULT nextval('datalayer_orgid_seq'::regclass);

/*-- collabroomdatalayer --*/

CREATE TABLE collabroomdatalayer (
    collabroomdatalayerid integer NOT NULL,
    collabroomid integer NOT NULL,
    datalayerid character varying(255) NOT NULL,
    userId character varying(255) NOT NULL
);

ALTER TABLE collabroomdatalayer OWNER TO nics;
GRANT ALL PRIVILEGES ON TABLE collabroomdatalayer TO public;

/*-- Image feature table --*/

CREATE TABLE imagefeature (
    imageid varchar NOT NULL,
    location geometry NOT NULL,
    filename varchar NOT NULL,
        CONSTRAINT enforce_srid_bounds CHECK ((st_srid(location) = 3857))
);
/*-- alert --*/

CREATE TABLE alert (
    alertid integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    message text,
    username character varying(100),
    PRIMARY KEY(alertid)
);

ALTER TABLE alert OWNER TO nics;

CREATE SEQUENCE alert_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE alert_seq OWNER TO nics;
ALTER SEQUENCE alert_seq OWNED BY alert.alertid;


/*-- alertuser --*/

CREATE TABLE alertuser (
    alertuserid integer NOT NULL,
    userId integer,
    alertid integer NOT NULL,
    incidentId integer NOT NULL,
    PRIMARY KEY(alertuserid)
);

ALTER TABLE alertuser OWNER TO nics;

CREATE SEQUENCE alert_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE alert_user_seq OWNER TO nics;
ALTER SEQUENCE alert_user_seq OWNED BY alertuser.alertuserid;

/*------------------------------------------------------------------*/
/*--------------------- Adding Missing sequences -------------------*/
/*------------------------------------------------------------------*/

CREATE SEQUENCE formid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 9
  CACHE 1;

ALTER TABLE formid_seq OWNER TO nics;
ALTER SEQUENCE formid_seq OWNED BY form.formid;

ALTER TABLE ONLY form ALTER COLUMN formid SET DEFAULT nextval('formid_seq'::regclass);
/*-----------   Adding system_workspac_id sequence*/

CREATE SEQUENCE system_workspace_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;

ALTER TABLE system_workspace_id_seq OWNER TO nics;
ALTER SEQUENCE system_workspace_id_seq OWNED BY system_workspace.system_workspace_id;

ALTER TABLE ONLY system_workspace ALTER COLUMN system_workspace_id SET DEFAULT nextval('system_workspace_id_seq'::regclass);

/*-----------   Adding collabroomdatalayer_collabroomdatalayerid_seq sequence*/

CREATE SEQUENCE collabroomdatalayer_collabroomdatalayerid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 91
  CACHE 1;

ALTER TABLE collabroomdatalayer_collabroomdatalayerid_seq OWNER TO nics;
ALTER SEQUENCE collabroomdatalayer_collabroomdatalayerid_seq OWNED BY collabroomdatalayer.collabroomdatalayerid;

ALTER TABLE ONLY collabroomdatalayer ALTER COLUMN collabroomdatalayerid SET DEFAULT nextval('collabroomdatalayer_collabroomdatalayerid_seq'::regclass);

/*------------------------------------------------------------------*/
/*--------------------- Adding Missing Values ----------------------*/
/*------------------------------------------------------------------*/

INSERT INTO formtype VALUES (nextVal('form_seq'), 'GAR');
INSERT INTO formtype VALUES (nextVal('form_seq'), '201');
INSERT INTO formtype VALUES (nextVal('form_seq'), '202');
INSERT INTO formtype VALUES (nextVal('form_seq'), '203');
INSERT INTO formtype VALUES (nextVal('form_seq'), '204');
INSERT INTO formtype VALUES (nextVal('form_seq'), '205');
INSERT INTO formtype VALUES (nextVal('form_seq'), '206');

INSERT INTO folder (folderid, foldername, parentfolderid, index, workspaceid) VALUES ('29116d2a-d381-11e6-bf26-cec0c932ce01','Reports','3103D8FC-990F-4EF1-9D0E-F3490A05A0EB',1,1);
INSERT INTO folder (folderid, foldername, parentfolderid, index, workspaceid) VALUES ('42f0d320-d381-11e6-bf26-cec0c932ce01', 'Damage', '29116d2a-d381-11e6-bf26-cec0c932ce01',2,1);
INSERT INTO folder (folderid, foldername, parentfolderid, index, workspaceid) VALUES ('b3b2e0e4-d381-11e6-bf26-cec0c932ce01','General','29116d2a-d381-11e6-bf26-cec0c932ce01',2,1);
INSERT INTO folder (folderid, foldername, parentfolderid, index, workspaceid) VALUES ('B673e108-7ca0-4907-8b62-ebf3d56e91f7','Upload','f673e108-7ca0-4907-8b62-ebf3d56e91f6',2,1);

CREATE SEQUENCE orgfolderid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE orgfolderid_seq OWNER TO nics;

ALTER SEQUENCE orgfolderid_seq OWNED BY orgfolder.orgfolderid;

ALTER TABLE ONLY orgfolder ALTER COLUMN orgfolderid SET DEFAULT nextval('orgfolderid_seq'::regclass);


/* datasource */
INSERT INTO datalayersource VALUES('AAA21937-B504-4F42-81B1-81B496F919AF', now(), 'AAAAAAAA-AD76-439D-BEB5-C019EB6553A2', 'image/png', '/CA7A9021-4C77-4533-B6CF-464850B82784.kml', 'EPSG:4326', 0, null, null, null, 1);

INSERT INTO datalayersource(created, datalayersourceid,datasourceid,refreshrate,usersessionid, opacity) VALUES (now(),'0b79bd02-bf28-494d-aa2f-f2ce858d9db8','AAAAAAAA-AD76-439D-BEB5-C019EB6553A1',0,1,1);

INSERT INTO datalayersource(created,datalayersourceid,datasourceid,refreshrate,usersessionid, opacity) VALUES (now(),'62352220-c0f9-4652-a412-28e6b2fdaa95','AAAAAAAA-AD76-439D-BEB5-C019EB6553A1',0,1,1);

/*  Datalayersource values */

Update datalayersource set opacity=1 where opacity IS NULL;

CREATE OR REPLACE FUNCTION reset_orgcaps() RETURNS void AS $$
DECLARE orgid integer;
DECLARE capid integer;
BEGIN
    DELETE FROM orgcap;
    FOR orgid IN SELECT org.orgid FROM org
    LOOP
        FOR capid IN SELECT cap.capid FROM cap
        LOOP
            INSERT INTO orgcap values (nextval('org_cap_seq'),orgid,capid,'t','t');
        END LOOP;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT reset_orgcaps();

CREATE OR REPLACE FUNCTION new_org_add_caps() RETURNS TRIGGER AS $$
DECLARE capid integer;
BEGIN
    FOR capid IN SELECT cap.capid FROM cap
    LOOP
        INSERT INTO orgcap values (nextval('org_cap_seq'),NEW.orgid,capid,'t','t');
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS populate_caps on org;


CREATE TRIGGER populate_caps
  AFTER INSERT
  ON org
  FOR EACH ROW
  EXECUTE PROCEDURE new_org_add_caps();

CREATE SEQUENCE document_org_document_orgid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY document_org ALTER COLUMN document_orgid SET DEFAULT nextval('document_org_document_orgid_seq'::regclass);

GRANT USAGE, SELECT ON  SEQUENCE document_org_document_orgid_seq TO nics;

CREATE SEQUENCE document_incident_document_incidentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY document_incident ALTER COLUMN document_incidentid SET DEFAULT nextval('document_incident_document_incidentid_seq'::regclass);

GRANT USAGE, SELECT ON  SEQUENCE document_incident_document_incidentid_seq TO nics;

