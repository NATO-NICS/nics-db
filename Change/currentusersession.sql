ALTER TABLE currentusersession ADD COLUMN mobile boolean;
ALTER TABLE currentusersession DROP CONSTRAINT "uniquecurrentusersession_userid_workspaceid";
