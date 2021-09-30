ALTER TABLE collabroomdatalayer ADD COLUMN hazard varchar(2000);

CREATE table incident_folder (
    folderid varchar(255) REFERENCES folder(folderid),
    incidentid integer REFERENCES incident(incidentid),
    created timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY (incidentid, folderid)
);