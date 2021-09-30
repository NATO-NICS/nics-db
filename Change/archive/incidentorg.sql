-- Change file for incident_org feature


-- Join table for which orgs have been secured to an incident
CREATE TABLE incident_org (
    orgid integer not null,
    incidentid integer not null,
    userid integer not null,
    created timestamp without time zone DEFAULT now() NOT NULL,
    primary key(incidentid, orgid)
);

ALTER TABLE incident_org ADD CONSTRAINT incident_org_orgid_fkey FOREIGN KEY (orgid) REFERENCES org(orgid);
ALTER TABLE incident_org ADD CONSTRAINT incident_org_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES incident(incidentid);
ALTER TABLE incident_org ADD CONSTRAINT incident_org_userid_fkey FOREIGN KEY (userid) REFERENCES "user"(userid);

GRANT ALL PRIVILEGES ON TABLE incident_org TO public;