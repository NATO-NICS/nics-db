

CREATE TABLE org_incidenttype (
    org_incidenttypeid integer NOT NULL,
    orgid integer NOT NULL,
    incidenttypeid integer,
    unique(orgid, incidenttypeid)
);

grant all privileges on table org_incidenttype to public;