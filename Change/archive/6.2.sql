ALTER TABLE ONLY log ALTER COLUMN logid SET DEFAULT nextval('log_seq'::regclass);
ALTER TABLE log add column workspaceid int;
DROP TABLE log_workspace;
ALTER TABLE datasource add column username varchar(64);
ALTER TABLE datasource add column password varchar(64);
