-- Add defaulttype to org_incidenttype
ALTER TABLE org_incidenttype ADD COLUMN defaulttype boolean default false;

-- Add a unique constraint to the incidenttypename column of incidenttype
-- NOTE: If there's already a duplicate entry, you will have to delete one before you can add this constraint successfully
ALTER TABLE incidenttype ADD UNIQUE(incidenttypename);

-- Add a foreign key to incident_incidenttype so you can't delete an incidenttype if it's in use by an incident
ALTER TABLE incident_incidenttype ADD CONSTRAINT incident_incidenttype_incidenttypeid_fkey FOREIGN KEY (incidenttypeid) REFERENCES incidenttype(incidenttypeid);
