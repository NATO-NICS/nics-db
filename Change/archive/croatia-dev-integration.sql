CREATE TABLE country (
        countryid SERIAL PRIMARY KEY,
        name VARCHAR(512) NOT NULL,
        countrycode VARCHAR(5) NOT NULL
);

CREATE TABLE region (
        regionid SERIAL PRIMARY KEY,
        regioncode VARCHAR (32),
        regionname VARCHAR(512),
        countryid INT REFERENCES country (countryid)
);

ALTER table collabroomdatalayer ADD COLUMN enablemobile boolean;
ALTER table collabroomdatalayer ADD COLUMN collabroomopacity double precision;
ALTER table collabroomdatalayer ALTER column collabroomopacity SET DEFAULT 1;

ALTER TABLE country OWNER to nics;

ALTER SEQUENCE country_countryid_seq OWNER to nics;

ALTER TABLE region OWNER to nics;

ALTER SEQUENCE region_regionid_seq OWNER to nics;

GRANT ALL PRIVILEGES ON TABLE country to PUBLIC;

GRANT ALL PRIVILEGES ON TABLE region to PUBLIC;

ALTER table org drop column country;

ALTER table org add column countryid int references country(countryid);

ALTER TABLE org ALTER COLUMN state type varchar(200);

copy country(name, countrycode) from '/var/lib/postgresql/countries.csv' DELIMITER ',';

/** Option to autorestrict incidents on org **/
alter table org add column restrictincidents boolean default true;

/** Constraint to disallow non-existent orgids from being inserted */
ALTER table incident_org ADD CONSTRAINT incident_org_orgid FOREIGN KEY (orgid) REFERENCES org (orgid);
