-- Adding display field to contacttype
ALTER table contacttype ADD COLUMN display character varying(120) NOT NULL default '';
update contacttype set display='Email' where type='email';
update contacttype set display='Phone (Home)' where type='phone_home';
update contacttype set display='Phone (Cell)' where type='phone_cell';
update contacttype set display='Phone (Office)' where type='phone_office';
update contacttype set display='Radio Number' where type='radio_number';
update contacttype set display='Phone (Other)' where type='phone_other';

