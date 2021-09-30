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

