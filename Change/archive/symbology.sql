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

-- Update graphic paths to be relative to just the symbology zip path
update feature set graphic = replace(graphic, 'images/drawmenu/markers/', '') where type='marker';

-- Now look at remaining graphics that don't have a /, meaning they used to live in images/drawmenu/markers/ root, and add them to ics/
update feature set graphic = concat('ics/', graphic) where graphic not like '%/%' and type='marker';
