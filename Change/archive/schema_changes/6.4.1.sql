DROP TABLE system_workspace;
DROP TABLE nicssystem;
ALTER TABLE form ADD COLUMN collabroomid integer;
ALTER TABLE ONLY form 
    ADD CONSTRAINT fk_form_collabroomid FOREIGN KEY (collabroomid) REFERENCES collabroom(collabroomid);

alter table datalayersource add column styleicon varchar(256);
