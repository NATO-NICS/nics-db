ALTER TABLE IncidentType ADD COLUMN defaultType boolean;
UPDATE IncidentType set defaultType='t';

ALTER TABLE incidenttype ALTER COLUMN incidenttypename TYPE varchar(100);

INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Landslide, Snow Avalanche', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Ice Accumulation on Watercourses and Traffic Infrastructure', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Bad Weather', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Road, Rail, and Traffic Accidents', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Mine Incident', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Release or Dispersion of Harmful and Toxic Substances', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Watercourse, Land and Environment Pollution', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Collision or Overflow on Dams', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Damage on Factory Infrastructure', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Human Infectious Diseases', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Animal Infectius Diseases', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Radiological, chemical, Biological Contamination', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Human Food or Water Poisoning', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Damage on Electric, Water Supply, Natural Gas, Telecommunication or Traffic Infrastructure', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Unexploded Ordinanace', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Search and Resuce', false);
INSERT INTO IncidentType VALUES((select nextval('hibernate_sequence')), 'Other', false);

