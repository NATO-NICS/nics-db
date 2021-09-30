-- This change updates the document_XXX join tables so their id is a SERIAL sequence, and not a varchar. This goes along
-- with an entity change, from String to int for these ID fields. There will eventually be an entity fix for the types
-- but holding off for now.
CREATE SEQUENCE document_org_document_orgid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY document_org ALTER COLUMN document_orgid SET DEFAULT nextval('document_org_document_orgid_seq'::regclass);

-- NOTE: these grants will fail if running this as nics, and it was already created by postgres user
GRANT USAGE, SELECT ON  SEQUENCE document_org_document_orgid_seq TO nics;

SELECT setval('document_org_document_orgid_seq', max(cast(document_orgid as int) + 1)) FROM document_org;

CREATE SEQUENCE document_incident_document_incidentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY document_incident ALTER COLUMN document_incidentid SET DEFAULT nextval('document_incident_document_incidentid_seq'::regclass);

-- NOTE: these grants will fail if running this as nics, and it was already created by postgres user
GRANT USAGE, SELECT ON  SEQUENCE document_incident_document_incidentid_seq TO nics;

SELECT setval('document_incident_document_incidentid_seq', max(cast(document_incidentid as int) + 1)) FROM document_incident;
