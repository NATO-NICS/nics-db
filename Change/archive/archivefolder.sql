INSERT INTO folder (folderid, foldername, workspaceid)
	VALUES ('80913fb1-f58a-4b55-95a1-9db4a251d639', 'Archived', 1),('CBC7714A-E873-44AA-8A9F-200FC1074C9E', 'Archived', 2),('E00C01CB-9E84-441A-A0B6-1C5D007DDF0B', 'Archived', 3),('39889113-C884-491E-8A98-565D17D99A49', 'Archived', 4),('A86789CB-08A3-4894-BB0E-52C5B6D45C35', 'Archived', 5),('840E9837-0FAC-4AD9-B3AE-548FC04CBB6F', 'Archived', 6),('D5CCCADD-8487-4D8E-BD8E-D8E77E551CDB', 'Archived', 7),('663648FF-6D48-4F62-8E8F-0629E3AADC3C', 'Archived', 8);
INSERT INTO rootfolder (rootid, folderid, tabname, workspaceid)
	VALUES ((select nextval('hibernate_sequence')), '80913fb1-f58a-4b55-95a1-9db4a251d639', 'Archived', 1),((select nextval('hibernate_sequence')),'CBC7714A-E873-44AA-8A9F-200FC1074C9E', 'Archived', 2),((select nextval('hibernate_sequence')),'E00C01CB-9E84-441A-A0B6-1C5D007DDF0B', 'Archived', 3),((select nextval('hibernate_sequence')),'39889113-C884-491E-8A98-565D17D99A49', 'Archived', 4),((select nextval('hibernate_sequence')),'A86789CB-08A3-4894-BB0E-52C5B6D45C35', 'Archived', 5),((select nextval('hibernate_sequence')),'840E9837-0FAC-4AD9-B3AE-548FC04CBB6F', 'Archived', 6),((select nextval('hibernate_sequence')),'D5CCCADD-8487-4D8E-BD8E-D8E77E551CDB', 'Archived', 7),((select nextval('hibernate_sequence')),'663648FF-6D48-4F62-8E8F-0629E3AADC3C', 'Archived', 8);
ALTER TABLE incident ADD COLUMN folderid varchar(255);
UPDATE incident SET folderid = '80913fb1-f58a-4b55-95a1-9db4a251d639'
	WHERE active='f';
ALTER TABLE incident ADD CONSTRAINT incident_folderid_fkey
	FOREIGN KEY (folderid) REFERENCES folder (folderid);
