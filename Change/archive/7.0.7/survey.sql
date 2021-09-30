
-- Make formtype name unique on formtype table
alter table formtype add constraint formtypename_unique_constraint unique(formtypename);



-- Survey tables

create table survey (
    surveyid serial primary key,
    title varchar not null unique,
    survey JSON not null,
    created timestamp with time zone default now()
);

create table surveyhistory (
	surveyhistoryid bigserial primary key,
	surveyid integer references survey(surveyid),
	title varchar not null,
	survey json not null,
	originaldate timestamp with time zone not null,
	archiveddate timestamp with time zone not null default now()
);

create table surveyresult (
    surveyresultid serial primary key,
    surveyid integer not null references survey(surveyid),
    userid varchar not null,
    surveyresult JSON not null,
    created timestamp with time zone default now()
);

-- Incidenttype to Formtype mapping
create table formtype_survey (
	formtype_survey_id serial primary key,
	formtypename varchar not null references formtype(formtypename),
	surveyid integer not null references survey(surveyid),
	constraint uniqueformtypesurvey unique(formtypename, surveyid)
);

create table incidenttype_formtype (
	incidenttype_formtype_id serial primary key,
	incidenttypeid integer not null references incidenttype(incidenttypeid),
	formtypeid integer not null references formtype(formtypeid),
	constraint uniqueincidenttypeformtype unique(incidenttypeid, formtypeid)
);