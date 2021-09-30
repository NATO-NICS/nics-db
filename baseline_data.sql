--
-- Copyright (c) 2008-2015, Massachusetts Institute of Technology (MIT)
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this
-- list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice,
-- this list of conditions and the following disclaimer in the documentation
-- and/or other materials provided with the distribution.
--
-- 3. Neither the name of the copyright holder nor the names of its contributors
-- may be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
-- FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
-- SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
-- CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
-- OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-- OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--

--
-- PostgreSQL database dump
-- Created with pg_dump -t formtype -t incidenttype -t messagepermissions -t orgtype  -t systemrole -t contacttype -t datasourcetype -t logtype -a --inserts dev.sacore > /tmp/baseline_data.sql
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;

INSERT INTO contacttype VALUES (DEFAULT, 'email', 'Email');
INSERT INTO contacttype VALUES (DEFAULT, 'phone_home', 'Phone (Home)');
INSERT INTO contacttype VALUES (DEFAULT, 'phone_cell', 'Phone (Cell)');
INSERT INTO contacttype VALUES (DEFAULT, 'phone_office', 'Phone (Office)');
INSERT INTO contacttype VALUES (DEFAULT, 'radio_number', 'Radio Number');
INSERT INTO contacttype VALUES (DEFAULT, 'phone_other', 'Phone (Other)');

INSERT INTO datasourcetype VALUES ('wms', DEFAULT);
INSERT INTO datasourcetype VALUES ('kml', DEFAULT);
INSERT INTO datasourcetype VALUES ('wmts', DEFAULT);
INSERT INTO datasourcetype VALUES ('kmz', DEFAULT);
INSERT INTO datasourcetype VALUES ('wfs', DEFAULT);
INSERT INTO datasourcetype VALUES ('georss', DEFAULT);
INSERT INTO datasourcetype VALUES ('arcgisrest', DEFAULT);
INSERT INTO datasourcetype VALUES ('xyz', DEFAULT);
INSERT INTO datasourcetype VALUES ('osm', DEFAULT);
INSERT INTO datasourcetype VALUES ('google', DEFAULT);
INSERT INTO datasourcetype VALUES ('document', DEFAULT);
INSERT INTO datasourcetype VALUES ('arcgiscache', DEFAULT);
INSERT INTO datasourcetype VALUES ('gpx', DEFAULT);
INSERT INTO datasourcetype VALUES ('bing', DEFAULT);
INSERT INTO datasourcetype VALUES ('geojson', DEFAULT);

INSERT INTO formtype VALUES (DEFAULT, 'ROC');
INSERT INTO formtype VALUES (DEFAULT, 'RESC');
INSERT INTO formtype VALUES (DEFAULT, 'ABC');
INSERT INTO formtype VALUES (DEFAULT, '215');
INSERT INTO formtype VALUES (DEFAULT, 'SITREP');
INSERT INTO formtype VALUES (DEFAULT, 'ASSGN');
INSERT INTO formtype VALUES (DEFAULT, 'SR');
INSERT INTO formtype VALUES (DEFAULT, 'FR');
INSERT INTO formtype VALUES (DEFAULT, 'TASK');
INSERT INTO formtype VALUES (DEFAULT, 'RESREQ');
INSERT INTO formtype VALUES (DEFAULT, '9110');
INSERT INTO formtype VALUES (DEFAULT, 'DMGRPT');
INSERT INTO formtype VALUES (DEFAULT, 'UXO');
INSERT INTO formtype VALUES (DEFAULT, 'SVRRPT');
INSERT INTO formtype VALUES (DEFAULT, 'AGRRPT');
INSERT INTO formtype VALUES (DEFAULT, 'MITAM');
INSERT INTO formtype VALUES (DEFAULT, 'WR');
INSERT INTO formtype VALUES (DEFAULT, 'GAR');
INSERT INTO formtype VALUES (DEFAULT, '201');
INSERT INTO formtype VALUES (DEFAULT, '203');
INSERT INTO formtype VALUES (DEFAULT, '204');
INSERT INTO formtype VALUES (DEFAULT, '204A');
INSERT INTO formtype VALUES (DEFAULT, '207');
INSERT INTO formtype VALUES (DEFAULT, '202');
INSERT INTO formtype VALUES (DEFAULT, '205');
INSERT INTO formtype VALUES (DEFAULT, '206');
INSERT INTO formtype VALUES (DEFAULT, 'CBRNE');
INSERT INTO formtype VALUES (DEFAULT, 'MKFLOOD');
INSERT INTO formtype VALUES (DEFAULT, 'LS');
INSERT INTO formtype VALUES (DEFAULT, 'MKMEDIA');
INSERT INTO formtype VALUES (DEFAULT, 'CR');
INSERT into formtype VALUES (DEFAULT, 'EOD');

INSERT INTO incidenttype VALUES (DEFAULT, 'Fire (Wildland)', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Mass Casualty', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Search and Rescue', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Terrorist Threat / Attack', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Fire (Structure)', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Hazardous Materials', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Blizzard', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Hurricane', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Earthquake', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Nuclear Accident',true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Oil Spill', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Planned Event', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Public Health / Medical Emergency', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Tornado', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Tropical Storm', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Tsunami', true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Aircraft Accident',true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Civil Unrest',true);
INSERT INTO incidenttype VALUES (DEFAULT, 'Flood',true);
INSERT INTO IncidentType VALUES (DEFAULT, 'Landslide, Snow Avalanche', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Ice Accumulation on Watercourses and Traffic Infrastructure', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Bad Weather', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Road, Rail, and Traffic Accidents', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Mine Incident', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Release or Dispersion of Harmful and Toxic Substances', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Watercourse, Land and Environment Pollution', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Collision or Overflow on Dams', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Damage on Factory Infrastructure', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Human Infectious Diseases', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Animal Infectious Diseases', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Radiological, Chemical, Biological Contamination', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Human Food or Water Poisoning', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Damage on Electric, Water Supply, Natural Gas, Telecommunication or Traffic Infrastructure', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Unexploded Ordinance', false);
INSERT INTO IncidentType VALUES (DEFAULT, 'Other', false);

INSERT INTO logtype VALUES (DEFAULT , 'announcement');
INSERT INTO logtype VALUES (DEFAULT, 'alert');

-- NOTE: don't use default ids until we remove the use of constants referring to a specific value
INSERT INTO systemrole VALUES (1, 'user');
INSERT INTO systemrole VALUES (2, 'readOnly');
INSERT INTO systemrole VALUES (3, 'gis');
INSERT INTO systemrole VALUES (4, 'admin');
INSERT INTO systemrole VALUES (5, 'super');

INSERT INTO orgtype VALUES (DEFAULT, 'Fire/Rescue');
INSERT INTO orgtype VALUES (DEFAULT, 'Law Enforcement');
INSERT INTO orgtype VALUES (DEFAULT, 'Academia');
INSERT INTO orgtype VALUES (DEFAULT, 'Office of Emergency Services');
INSERT INTO orgtype VALUES (DEFAULT, 'Military');
INSERT INTO orgtype VALUES (DEFAULT, 'Other Government');
INSERT INTO orgtype VALUES (DEFAULT, 'Non-Governmental Organization');
INSERT INTO orgtype VALUES (DEFAULT, 'Private Volunteer Organization');
INSERT INTO orgtype VALUES (DEFAULT, 'Corporate');
INSERT INTO orgtype VALUES (DEFAULT, 'IMT');
INSERT INTO orgtype VALUES (DEFAULT, 'USAR');
INSERT INTO orgtype VALUES (DEFAULT, 'Federal');
INSERT INTO orgtype VALUES (DEFAULT, 'Other Local IMT');
INSERT INTO orgtype VALUES (DEFAULT, 'CDF IMT');
INSERT INTO orgtype VALUES (DEFAULT, 'Federal IMT');

INSERT INTO cap VALUES (DEFAULT,'ROC','ROC Report');
INSERT INTO cap VALUES (DEFAULT,'ABC','FMAG - ABC Report');
INSERT INTO cap VALUES (DEFAULT,'215','IC-215 Worksheet Report');
INSERT INTO cap VALUES (DEFAULT,'SR','General Message Report');
INSERT INTO cap VALUES (DEFAULT,'DMGRPT','Damage Report');
INSERT INTO cap VALUES (DEFAULT,'MIV','Multi Incident View');
INSERT INTO cap VALUES (DEFAULT,'201','201 Report');
INSERT INTO cap VALUES (DEFAULT,'202','202 Report');
INSERT INTO cap VALUES (DEFAULT,'203','203 Report');
INSERT INTO cap VALUES (DEFAULT,'204','204 Report');
INSERT INTO cap VALUES (DEFAULT,'204A','204a Report');
INSERT INTO cap VALUES (DEFAULT,'205','205 Report');
INSERT INTO cap VALUES (DEFAULT,'206','206 Report');
INSERT INTO cap VALUES (DEFAULT,'207','207 Report');
INSERT INTO cap VALUES (DEFAULT,'GAR','GAR Report');
INSERT INTO cap VALUES (DEFAULT,'MKMEDIA','Media Report');
INSERT INTO cap VALUES (DEFAULT,'LS','Landslide Report');
INSERT INTO cap VALUES (DEFAULT,'CBRNE','RBC Report');
INSERT INTO cap VALUES (DEFAULT,'MKFLOOD','Flood Report');
INSERT INTO cap VALUES (DEFAULT,'CR','Chat Report');
INSERT into cap VALUES (DEFAULT,'EOD','EOD Report');

-- remotelog
INSERT INTO remotelogtype VALUES (DEFAULT, 'unknown');
INSERT INTO remotelogtype VALUES (DEFAULT, 'INFO');
INSERT INTO remotelogtype VALUES (DEFAULT, 'WARN');
INSERT INTO remotelogtype VALUES (DEFAULT, 'DEBUG');
INSERT INTO remotelogtype VALUES (DEFAULT, 'ERROR');
INSERT INTO remotelogtype VALUES (DEFAULT, 'TRACE');
INSERT INTO remotelogtype VALUES (DEFAULT, 'TEST');
INSERT INTO remotelogtype VALUES (DEFAULT, 'EXCEPTION');

-- country
INSERT INTO country (name, countrycode) VALUES ('Afghanistan','AF');
INSERT INTO country (name, countrycode) VALUES ('Albania','AL');
INSERT INTO country (name, countrycode) VALUES ('Algeria','DZ');
INSERT INTO country (name, countrycode) VALUES ('American Samoa','AS');
INSERT INTO country (name, countrycode) VALUES ('Andorra','AD');
INSERT INTO country (name, countrycode) VALUES ('Angola','AO');
INSERT INTO country (name, countrycode) VALUES ('Anguilla','AI');
INSERT INTO country (name, countrycode) VALUES ('Antarctica','AQ');
INSERT INTO country (name, countrycode) VALUES ('Antigua and Barbuda','AG');
INSERT INTO country (name, countrycode) VALUES ('Argentina','AR');
INSERT INTO country (name, countrycode) VALUES ('Armenia','AM');
INSERT INTO country (name, countrycode) VALUES ('Aruba','AW');
INSERT INTO country (name, countrycode) VALUES ('Australia','AU');
INSERT INTO country (name, countrycode) VALUES ('Austria','AT');
INSERT INTO country (name, countrycode) VALUES ('Azerbaijan','AZ');
INSERT INTO country (name, countrycode) VALUES ('Bahamas','BS');
INSERT INTO country (name, countrycode) VALUES ('Bahrain','BH');
INSERT INTO country (name, countrycode) VALUES ('Bangladesh','BD');
INSERT INTO country (name, countrycode) VALUES ('Barbados','BB');
INSERT INTO country (name, countrycode) VALUES ('Belarus','BY');
INSERT INTO country (name, countrycode) VALUES ('Belgium','BE');
INSERT INTO country (name, countrycode) VALUES ('Belize','BZ');
INSERT INTO country (name, countrycode) VALUES ('Benin','BJ');
INSERT INTO country (name, countrycode) VALUES ('Bermuda','BM');
INSERT INTO country (name, countrycode) VALUES ('Bhutan','BT');
INSERT INTO country (name, countrycode) VALUES ('Bolivia','BO');
INSERT INTO country (name, countrycode) VALUES ('Bonaire','BQ');
INSERT INTO country (name, countrycode) VALUES ('Bosnia and Herzegovina','BA');
INSERT INTO country (name, countrycode) VALUES ('Botswana','BW');
INSERT INTO country (name, countrycode) VALUES ('Bouvet Island','BV');
INSERT INTO country (name, countrycode) VALUES ('Brazil','BR');
INSERT INTO country (name, countrycode) VALUES ('British Indian Ocean Territory','IO');
INSERT INTO country (name, countrycode) VALUES ('British Virgin Islands','VG');
INSERT INTO country (name, countrycode) VALUES ('Brunei','BN');
INSERT INTO country (name, countrycode) VALUES ('Bulgaria','BG');
INSERT INTO country (name, countrycode) VALUES ('Burkina Faso','BF');
INSERT INTO country (name, countrycode) VALUES ('Burundi','BI');
INSERT INTO country (name, countrycode) VALUES ('Cambodia','KH');
INSERT INTO country (name, countrycode) VALUES ('Cameroon','CM');
INSERT INTO country (name, countrycode) VALUES ('Canada','CA');
INSERT INTO country (name, countrycode) VALUES ('Cape Verde','CV');
INSERT INTO country (name, countrycode) VALUES ('Cayman Islands','KY');
INSERT INTO country (name, countrycode) VALUES ('Central African Republic','CF');
INSERT INTO country (name, countrycode) VALUES ('Chad','TD');
INSERT INTO country (name, countrycode) VALUES ('Chile','CL');
INSERT INTO country (name, countrycode) VALUES ('China','CN');
INSERT INTO country (name, countrycode) VALUES ('Christmas Island','CX');
INSERT INTO country (name, countrycode) VALUES ('Cocos Islands','CC');
INSERT INTO country (name, countrycode) VALUES ('Colombia','CO');
INSERT INTO country (name, countrycode) VALUES ('Comoros','KM');
INSERT INTO country (name, countrycode) VALUES ('Cook Islands','CK');
INSERT INTO country (name, countrycode) VALUES ('Costa Rica','CR');
INSERT INTO country (name, countrycode) VALUES ('Croatia','HR');
INSERT INTO country (name, countrycode) VALUES ('Cuba','CU');
INSERT INTO country (name, countrycode) VALUES ('Curacao','CW');
INSERT INTO country (name, countrycode) VALUES ('Cyprus','CY');
INSERT INTO country (name, countrycode) VALUES ('Czech Republic','CZ');
INSERT INTO country (name, countrycode) VALUES ('Democratic Republic of the Congo','CD');
INSERT INTO country (name, countrycode) VALUES ('Denmark','DK');
INSERT INTO country (name, countrycode) VALUES ('Djibouti','DJ');
INSERT INTO country (name, countrycode) VALUES ('Dominica','DM');
INSERT INTO country (name, countrycode) VALUES ('Dominican Republic','DO');
INSERT INTO country (name, countrycode) VALUES ('East Timor','TL');
INSERT INTO country (name, countrycode) VALUES ('Ecuador','EC');
INSERT INTO country (name, countrycode) VALUES ('Egypt','EG');
INSERT INTO country (name, countrycode) VALUES ('El Salvador','SV');
INSERT INTO country (name, countrycode) VALUES ('Equatorial Guinea','GQ');
INSERT INTO country (name, countrycode) VALUES ('Eritrea','ER');
INSERT INTO country (name, countrycode) VALUES ('Estonia','EE');
INSERT INTO country (name, countrycode) VALUES ('Ethiopia','ET');
INSERT INTO country (name, countrycode) VALUES ('Falkland Islands','FK');
INSERT INTO country (name, countrycode) VALUES ('Faroe Islands','FO');
INSERT INTO country (name, countrycode) VALUES ('Fiji','FJ');
INSERT INTO country (name, countrycode) VALUES ('Finland','FI');
INSERT INTO country (name, countrycode) VALUES ('France','FR');
INSERT INTO country (name, countrycode) VALUES ('French Guiana','GF');
INSERT INTO country (name, countrycode) VALUES ('French Polynesia','PF');
INSERT INTO country (name, countrycode) VALUES ('French Southern Territories','TF');
INSERT INTO country (name, countrycode) VALUES ('Gabon','GA');
INSERT INTO country (name, countrycode) VALUES ('Gambia','GM');
INSERT INTO country (name, countrycode) VALUES ('Georgia','GE');
INSERT INTO country (name, countrycode) VALUES ('Germany','DE');
INSERT INTO country (name, countrycode) VALUES ('Ghana','GH');
INSERT INTO country (name, countrycode) VALUES ('Gibraltar','GI');
INSERT INTO country (name, countrycode) VALUES ('Greece','GR');
INSERT INTO country (name, countrycode) VALUES ('Greenland','GL');
INSERT INTO country (name, countrycode) VALUES ('Grenada','GD');
INSERT INTO country (name, countrycode) VALUES ('Guadeloupe','GP');
INSERT INTO country (name, countrycode) VALUES ('Guam','GU');
INSERT INTO country (name, countrycode) VALUES ('Guatemala','GT');
INSERT INTO country (name, countrycode) VALUES ('Guernsey','GG');
INSERT INTO country (name, countrycode) VALUES ('Guinea','GN');
INSERT INTO country (name, countrycode) VALUES ('Guinea-Bissau','GW');
INSERT INTO country (name, countrycode) VALUES ('Guyana','GY');
INSERT INTO country (name, countrycode) VALUES ('Haiti','HT');
INSERT INTO country (name, countrycode) VALUES ('Heard Island and McDonald Islands','HM');
INSERT INTO country (name, countrycode) VALUES ('Honduras','HN');
INSERT INTO country (name, countrycode) VALUES ('Hong Kong','HK');
INSERT INTO country (name, countrycode) VALUES ('Hungary','HU');
INSERT INTO country (name, countrycode) VALUES ('Iceland','IS');
INSERT INTO country (name, countrycode) VALUES ('India','IN');
INSERT INTO country (name, countrycode) VALUES ('Indonesia','ID');
INSERT INTO country (name, countrycode) VALUES ('Iran','IR');
INSERT INTO country (name, countrycode) VALUES ('Iraq','IQ');
INSERT INTO country (name, countrycode) VALUES ('Ireland','IE');
INSERT INTO country (name, countrycode) VALUES ('Isle of Man','IM');
INSERT INTO country (name, countrycode) VALUES ('Israel','IL');
INSERT INTO country (name, countrycode) VALUES ('Italy','IT');
INSERT INTO country (name, countrycode) VALUES ('Ivory Coast','CI');
INSERT INTO country (name, countrycode) VALUES ('Jamaica','JM');
INSERT INTO country (name, countrycode) VALUES ('Japan','JP');
INSERT INTO country (name, countrycode) VALUES ('Jersey','JE');
INSERT INTO country (name, countrycode) VALUES ('Jordan','JO');
INSERT INTO country (name, countrycode) VALUES ('Kazakhstan','KZ');
INSERT INTO country (name, countrycode) VALUES ('Kenya','KE');
INSERT INTO country (name, countrycode) VALUES ('Kiribati','KI');
INSERT INTO country (name, countrycode) VALUES ('Kosovo','XK');
INSERT INTO country (name, countrycode) VALUES ('Kuwait','KW');
INSERT INTO country (name, countrycode) VALUES ('Kyrgyzstan','KG');
INSERT INTO country (name, countrycode) VALUES ('Laos','LA');
INSERT INTO country (name, countrycode) VALUES ('Latvia','LV');
INSERT INTO country (name, countrycode) VALUES ('Lebanon','LB');
INSERT INTO country (name, countrycode) VALUES ('Lesotho','LS');
INSERT INTO country (name, countrycode) VALUES ('Liberia','LR');
INSERT INTO country (name, countrycode) VALUES ('Libya','LY');
INSERT INTO country (name, countrycode) VALUES ('Liechtenstein','LI');
INSERT INTO country (name, countrycode) VALUES ('Lithuania','LT');
INSERT INTO country (name, countrycode) VALUES ('Luxembourg','LU');
INSERT INTO country (name, countrycode) VALUES ('Macao','MO');
INSERT INTO country (name, countrycode) VALUES ('North Macedonia','MK');
INSERT INTO country (name, countrycode) VALUES ('Madagascar','MG');
INSERT INTO country (name, countrycode) VALUES ('Malawi','MW');
INSERT INTO country (name, countrycode) VALUES ('Malaysia','MY');
INSERT INTO country (name, countrycode) VALUES ('Maldives','MV');
INSERT INTO country (name, countrycode) VALUES ('Mali','ML');
INSERT INTO country (name, countrycode) VALUES ('Malta','MT');
INSERT INTO country (name, countrycode) VALUES ('Marshall Islands','MH');
INSERT INTO country (name, countrycode) VALUES ('Martinique','MQ');
INSERT INTO country (name, countrycode) VALUES ('Mauritania','MR');
INSERT INTO country (name, countrycode) VALUES ('Mauritius','MU');
INSERT INTO country (name, countrycode) VALUES ('Mayotte','YT');
INSERT INTO country (name, countrycode) VALUES ('Mexico','MX');
INSERT INTO country (name, countrycode) VALUES ('Micronesia','FM');
INSERT INTO country (name, countrycode) VALUES ('Moldova','MD');
INSERT INTO country (name, countrycode) VALUES ('Monaco','MC');
INSERT INTO country (name, countrycode) VALUES ('Mongolia','MN');
INSERT INTO country (name, countrycode) VALUES ('Montenegro','ME');
INSERT INTO country (name, countrycode) VALUES ('Montserrat','MS');
INSERT INTO country (name, countrycode) VALUES ('Morocco','MA');
INSERT INTO country (name, countrycode) VALUES ('Mozambique','MZ');
INSERT INTO country (name, countrycode) VALUES ('Myanmar','MM');
INSERT INTO country (name, countrycode) VALUES ('Namibia','NA');
INSERT INTO country (name, countrycode) VALUES ('Nauru','NR');
INSERT INTO country (name, countrycode) VALUES ('Nepal','NP');
INSERT INTO country (name, countrycode) VALUES ('Netherlands','NL');
INSERT INTO country (name, countrycode) VALUES ('New Caledonia','NC');
INSERT INTO country (name, countrycode) VALUES ('New Zealand','NZ');
INSERT INTO country (name, countrycode) VALUES ('Nicaragua','NI');
INSERT INTO country (name, countrycode) VALUES ('Niger','NE');
INSERT INTO country (name, countrycode) VALUES ('Nigeria','NG');
INSERT INTO country (name, countrycode) VALUES ('Niue','NU');
INSERT INTO country (name, countrycode) VALUES ('Norfolk Island','NF');
INSERT INTO country (name, countrycode) VALUES ('North Korea','KP');
INSERT INTO country (name, countrycode) VALUES ('Northern Mariana Islands','MP');
INSERT INTO country (name, countrycode) VALUES ('Norway','NO');
INSERT INTO country (name, countrycode) VALUES ('Oman','OM');
INSERT INTO country (name, countrycode) VALUES ('Pakistan','PK');
INSERT INTO country (name, countrycode) VALUES ('Palau','PW');
INSERT INTO country (name, countrycode) VALUES ('Palestine','PS');
INSERT INTO country (name, countrycode) VALUES ('Panama','PA');
INSERT INTO country (name, countrycode) VALUES ('Papua New Guinea','PG');
INSERT INTO country (name, countrycode) VALUES ('Paraguay','PY');
INSERT INTO country (name, countrycode) VALUES ('Peru','PE');
INSERT INTO country (name, countrycode) VALUES ('Philippines','PH');
INSERT INTO country (name, countrycode) VALUES ('Pitcairn Islands','PN');
INSERT INTO country (name, countrycode) VALUES ('Poland','PL');
INSERT INTO country (name, countrycode) VALUES ('Portugal','PT');
INSERT INTO country (name, countrycode) VALUES ('Puerto Rico','PR');
INSERT INTO country (name, countrycode) VALUES ('Qatar','QA');
INSERT INTO country (name, countrycode) VALUES ('Republic of the Congo','CG');
INSERT INTO country (name, countrycode) VALUES ('Réunion','RE');
INSERT INTO country (name, countrycode) VALUES ('Romania','RO');
INSERT INTO country (name, countrycode) VALUES ('Russia','RU');
INSERT INTO country (name, countrycode) VALUES ('Rwanda','RW');
INSERT INTO country (name, countrycode) VALUES ('Saint Barthélemy','BL');
INSERT INTO country (name, countrycode) VALUES ('Saint Helena','SH');
INSERT INTO country (name, countrycode) VALUES ('Saint Kitts and Nevis','KN');
INSERT INTO country (name, countrycode) VALUES ('Saint Lucia','LC');
INSERT INTO country (name, countrycode) VALUES ('Saint Martin','MF');
INSERT INTO country (name, countrycode) VALUES ('Saint Pierre and Miquelon','PM');
INSERT INTO country (name, countrycode) VALUES ('Saint Vincent and the Grenadines','VC');
INSERT INTO country (name, countrycode) VALUES ('Samoa','WS');
INSERT INTO country (name, countrycode) VALUES ('San Marino','SM');
INSERT INTO country (name, countrycode) VALUES ('São Tomé and Príncipe','ST');
INSERT INTO country (name, countrycode) VALUES ('Saudi Arabia','SA');
INSERT INTO country (name, countrycode) VALUES ('Senegal','SN');
INSERT INTO country (name, countrycode) VALUES ('Serbia','RS');
INSERT INTO country (name, countrycode) VALUES ('Seychelles','SC');
INSERT INTO country (name, countrycode) VALUES ('Sierra Leone','SL');
INSERT INTO country (name, countrycode) VALUES ('Singapore','SG');
INSERT INTO country (name, countrycode) VALUES ('Sint Maarten','SX');
INSERT INTO country (name, countrycode) VALUES ('Slovakia','SK');
INSERT INTO country (name, countrycode) VALUES ('Slovenia','SI');
INSERT INTO country (name, countrycode) VALUES ('Solomon Islands','SB');
INSERT INTO country (name, countrycode) VALUES ('Somalia','SO');
INSERT INTO country (name, countrycode) VALUES ('South Africa','ZA');
INSERT INTO country (name, countrycode) VALUES ('South Georgia and the South Sandwich Islands','GS');
INSERT INTO country (name, countrycode) VALUES ('South Korea','KR');
INSERT INTO country (name, countrycode) VALUES ('South Sudan','SS');
INSERT INTO country (name, countrycode) VALUES ('Spain','ES');
INSERT INTO country (name, countrycode) VALUES ('Sri Lanka','LK');
INSERT INTO country (name, countrycode) VALUES ('Sudan','SD');
INSERT INTO country (name, countrycode) VALUES ('Suriname','SR');
INSERT INTO country (name, countrycode) VALUES ('Svalbard and Jan Mayen','SJ');
INSERT INTO country (name, countrycode) VALUES ('Swaziland','SZ');
INSERT INTO country (name, countrycode) VALUES ('Sweden','SE');
INSERT INTO country (name, countrycode) VALUES ('Switzerland','CH');
INSERT INTO country (name, countrycode) VALUES ('Syria','SY');
INSERT INTO country (name, countrycode) VALUES ('Taiwan','TW');
INSERT INTO country (name, countrycode) VALUES ('Tajikistan','TJ');
INSERT INTO country (name, countrycode) VALUES ('Tanzania','TZ');
INSERT INTO country (name, countrycode) VALUES ('Thailand','TH');
INSERT INTO country (name, countrycode) VALUES ('Togo','TG');
INSERT INTO country (name, countrycode) VALUES ('Tokelau','TK');
INSERT INTO country (name, countrycode) VALUES ('Tonga','TO');
INSERT INTO country (name, countrycode) VALUES ('Trinidad and Tobago','TT');
INSERT INTO country (name, countrycode) VALUES ('Tunisia','TN');
INSERT INTO country (name, countrycode) VALUES ('Turkey','TR');
INSERT INTO country (name, countrycode) VALUES ('Turkmenistan','TM');
INSERT INTO country (name, countrycode) VALUES ('Turks and Caicos Islands','TC');
INSERT INTO country (name, countrycode) VALUES ('Tuvalu','TV');
INSERT INTO country (name, countrycode) VALUES ('U,S, Minor Outlying Islands','UM');
INSERT INTO country (name, countrycode) VALUES ('U,S, Virgin Islands','VI');
INSERT INTO country (name, countrycode) VALUES ('Uganda','UG');
INSERT INTO country (name, countrycode) VALUES ('Ukraine','UA');
INSERT INTO country (name, countrycode) VALUES ('United Arab Emirates','AE');
INSERT INTO country (name, countrycode) VALUES ('United Kingdom','GB');
INSERT INTO country (name, countrycode) VALUES ('United States','US');
INSERT INTO country (name, countrycode) VALUES ('Uruguay','UY');
INSERT INTO country (name, countrycode) VALUES ('Uzbekistan','UZ');
INSERT INTO country (name, countrycode) VALUES ('Vanuatu','VU');
INSERT INTO country (name, countrycode) VALUES ('Vatican City','VAT');
INSERT INTO country (name, countrycode) VALUES ('Venezuela','VE');
INSERT INTO country (name, countrycode) VALUES ('Vietnam','VN');
INSERT INTO country (name, countrycode) VALUES ('Wallis and Futuna','WF');
INSERT INTO country (name, countrycode) VALUES ('Western Sahara','EH');
INSERT INTO country (name, countrycode) VALUES ('Yemen','YE');
INSERT INTO country (name, countrycode) VALUES ('Zambia','ZM');
INSERT INTO country (name, countrycode) VALUES ('Zimbabwe','ZW');
INSERT INTO country (name, countrycode) VALUES ('Åland','AX');
