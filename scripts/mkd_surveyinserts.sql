--
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.survey (title, survey, created) VALUES ('Disaster report in mines or production facilities, major accidents and major breakdowns', '{
 "title": "Disaster report in mines or production facilities, major accidents and major breakdowns",
 "pages": [
  {
   "name": "page1",
   "elements": [
    {
     "type": "text",
     "name": "Date and Time of Report",
     "title": "Date and Time of Report",
     "inputType": "datetime"
    },
    {
     "type": "text",
     "name": "Date and Time of Incident (Local)",
     "title": "Date and Time of Incident (Local)",
     "inputType": "datetime-local"
    },
    {
     "type": "text",
     "name": "Date and Time of Incident (GMT)",
     "title": "Date and Time of Incident (GMT)",
     "inputType": "datetime"
    },
    {
     "type": "multipletext",
     "name": "Location, Dam, and Occupied Area",
     "title": "Location, Dam, and Occupied Area",
     "items": [
      {
       "name": "City",
       "title": "City"
      },
      {
       "name": "District",
       "title": "District"
      },
      {
       "name": "Region",
       "title": "Region"
      },
      {
       "name": "Geographical Coordinates",
       "title": "Geographical Coordinates"
      }
     ]
    },
    {
     "type": "comment",
     "name": "Cause of the event - Disasters / Major Accidents / Breakdowns",
     "title": "Cause of the event - Disasters / Major Accidents / Breakdowns"
    },
    {
     "type": "text",
     "name": "Number of human casualties and injuries",
     "title": "Number of human casualties and injuries",
     "inputType": "number"
    },
    {
     "type": "text",
     "name": "Material Damage",
     "title": "Material Damage"
    },
    {
     "type": "text",
     "name": "Damage to Power Grid",
     "title": "Damage to Power Grid"
    },
    {
     "type": "text",
     "name": "Damage to the Water Supply Network",
     "title": "Damage to the Water Supply Network"
    },
    {
     "type": "text",
     "name": "Damage to the telecommunication networks",
     "title": "Damage to the telecommunication networks"
    },
    {
     "type": "text",
     "name": "Damage to Buildings and Other Infrastructure",
     "title": "Damage to Buildings and Other Infrastructure"
    },
    {
     "type": "multipletext",
     "name": "Weather Conditions",
     "title": "Weather Conditions",
     "items": [
      {
       "name": "Wind Direction",
       "title": "Wind Direction"
      },
      {
       "name": "Degrees From",
       "title": "Degrees From"
      },
      {
       "name": "Wind Speed (m/sec)",
       "title": "Wind Speed (m/sec)"
      },
      {
       "name": "Temperature (Celsius)",
       "placeHolder": "Degrees Celsius",
       "inputType": "number",
       "title": "Temperature (Celsius)"
      },
      {
       "name": "Cloudiness",
       "placeHolder": "% (0 / 25 / 50 / 75/ 100)",
       "inputType": "number",
       "title": "Cloudiness"
      },
      {
       "name": "Precipitation / Rain-Snow / Amount",
       "title": "Precipitation / Rain-Snow / Amount"
      },
      {
       "name": "Forecast for next 3-5 Days",
       "title": "Forecast for next 3-5 Days"
      }
     ]
    },
    {
     "type": "multipletext",
     "name": "Environmental Parameters",
     "title": "Environmental Parameters",
     "items": [
      {
       "name": "Air Quality (air pollution)",
       "title": "Air Quality (air pollution)"
      },
      {
       "name": "CO2",
       "title": "CO2"
      },
      {
       "name": "NOx",
       "title": "NOx"
      },
      {
       "name": "NO",
       "title": "NO"
      },
      {
       "name": "NO2",
       "title": "NO2"
      },
      {
       "name": "O3",
       "title": "O3"
      },
      {
       "name": "CO",
       "title": "CO"
      },
      {
       "name": "PM10",
       "title": "PM10"
      },
      {
       "name": "PM2.5",
       "title": "PM2.5"
      }
     ]
    },
    {
     "type": "text",
     "name": "Water Quality (rivers and lakes)",
     "title": "Water Quality (rivers and lakes)"
    },
    {
     "type": "text",
     "name": "Other Environmental Parameters (soil, etc)",
     "title": "Other Environmental Parameters (soil, etc)"
    },
    {
     "type": "comment",
     "name": "Initial Assessment of Endangered, Injured, Missing",
     "title": "Initial Assessment of Endangered, Injured, Missing"
    },
    {
     "type": "comment",
     "name": "Initial Assessment of the Development of the situation for 24/48/27 hours",
     "title": "Initial Assessment of the Development of the situation for 24/48/27 hours"
    },
    {
     "type": "comment",
     "name": "Measures Taken",
     "title": "Measures Taken"
    },
    {
     "type": "comment",
     "name": "Resources Used (by Institutions)",
     "title": "Resources Used (by Institutions)"
    },
    {
     "type": "comment",
     "name": "Material (Technical)",
     "title": "Material (Technical)"
    },
    {
     "type": "text",
     "name": "Human - Care (Number of Persons)",
     "title": "Human - Care (Number of Persons)"
    },
    {
     "type": "comment",
     "name": "Human - Evacuation (number of persons, km / radius, receptions centers, etc)",
     "title": "Human - Evacuation (number of persons, km / radius, receptions centers, etc)"
    },
    {
     "type": "comment",
     "name": "Human - Others",
     "title": "Human - Others"
    },
    {
     "type": "comment",
     "name": "Help Needed to Overcome Consequences",
     "title": "Help Needed to Overcome Consequences"
    },
    {
     "type": "comment",
     "name": "Teams",
     "title": "Teams"
    },
    {
     "type": "comment",
     "name": "Materials",
     "title": "Materials"
    },
    {
     "type": "comment",
     "name": "Experts",
     "title": "Experts"
    },
    {
     "type": "comment",
     "name": "Other Relevant Data",
     "title": "Other Relevant Data"
    },
    {
     "type": "comment",
     "name": "Contact Details",
     "title": "Contact Details (247, fax, email, web, etc.)"
    }
   ]
  }
 ]
}', now());
INSERT INTO public.survey (title, survey, created) VALUES ('Earthquake Report', '{
 "title": "Earthquake Report",
 "pages": [
  {
   "name": "Earthquake Page 1",
   "elements": [
    {
     "type": "text",
     "name": "Date and time of the report",
     "title": "Date and time of the report",
     "inputType": "datetime-local"
    },
    {
     "type": "multipletext",
     "name": "Date and time of the event / occurrence locally and by GMT",
     "title": "Date and time of the event / occurrence locally and by GMT",
     "items": [
      {
       "name": "Local Time",
       "inputType": "datetime-local",
       "title": "Local Time"
      },
      {
       "name": "GMT",
       "inputType": "datetime",
       "title": "GMT"
      }
     ]
    },
    {
     "type": "comment",
     "name": "Epicenter location and busy area (City / area / region and geographical coordinates)",
     "title": "Epicenter location and busy area (City / area / region and geographical coordinates)"
    },
    {
     "type": "comment",
     "name": "Earthquake intensity / area",
     "title": "Earthquake intensity / area"
    },
    {
     "type": "comment",
     "name": "Event description (short and analytical)",
     "title": "Event description (short and analytical)"
    },
    {
     "type": "text",
     "name": "Number of Human Casualties and Injuries",
     "title": "Number of Human Casualties and Injuries",
     "inputType": "number"
    },
    {
     "type": "panel",
     "name": "Material Damage",
     "elements": [
      {
       "type": "comment",
       "name": "Damage to the power grid",
       "title": "Damage to the power grid"
      },
      {
       "type": "comment",
       "name": "Damage to the water supply network",
       "title": "Damage to the water supply network"
      },
      {
       "type": "comment",
       "name": "Damage to the telecommunication networks",
       "title": "Damage to the telecommunication networks"
      },
      {
       "type": "comment",
       "name": "Damage to the traffic infrastructure",
       "title": "Damage to the traffic infrastructure"
      },
      {
       "type": "comment",
       "name": "Damage to buildings and other infrastructure",
       "title": "Damage to buildings and other infrastructure"
      }
     ],
     "title": "Material Damage"
    },
    {
     "type": "panel",
     "name": "Weather Conditions",
     "elements": [
      {
       "type": "text",
       "name": "Wind Direction (degrees from)",
       "title": "Wind Direction (degrees from)"
      },
      {
       "type": "text",
       "name": "Wind Speed (m / sec)",
       "title": "Wind Speed (m / sec)"
      },
      {
       "type": "text",
       "name": "Temperature (degrees Celsius)",
       "title": "Temperature (degrees Celsius)"
      },
      {
       "type": "radiogroup",
       "name": "Cloudiness",
       "title": "Cloudiness",
       "isRequired": true,
       "choices": [
        {
         "value": "0",
         "text": "0%"
        },
        {
         "value": "25",
         "text": "25%"
        },
        {
         "value": "50",
         "text": "50%"
        },
        {
         "value": "75",
         "text": "75%"
        },
        {
         "value": "100",
         "text": "100%"
        }
       ]
      },
      {
       "type": "text",
       "name": "Precipitation / Rain-Snow / Amount",
       "title": "Precipitation / Rain-Snow / Amount"
      },
      {
       "type": "comment",
       "name": "Forecast for next 3-5 Days",
       "title": "Forecast for next 3-5 Days"
      },
      {
       "type": "panel",
       "name": "Environmental Parameters",
       "elements": [
        {
         "type": "multipletext",
         "name": "Air Quality (Pollution)",
         "title": "Air Quality (Pollution)",
         "items": [
          {
           "name": "CO2",
           "title": "CO2"
          },
          {
           "name": "NOx",
           "title": "NOx"
          },
          {
           "name": "NO",
           "title": "NO"
          },
          {
           "name": "NO2",
           "title": "NO2"
          },
          {
           "name": "O3",
           "title": "O3"
          },
          {
           "name": "CO",
           "title": "CO"
          },
          {
           "name": "PM10",
           "title": "PM10"
          },
          {
           "name": "PM25",
           "title": "PM2.5"
          }
         ]
        },
        {
         "type": "text",
         "name": "Water Quality (rivers and lakes)",
         "title": "Water Quality (rivers and lakes)"
        },
        {
         "type": "text",
         "name": "Other Environmental Parameters (soil, etc)",
         "title": "Other Environmental Parameters (soil, etc)"
        },
        {
         "type": "comment",
         "name": "Environmental, Food and Feed Monitoring",
         "title": "Environmental, Food and Feed Monitoring"
        }
       ],
       "title": "Environmental Parameters"
      },
      {
       "type": "comment",
       "name": "Initial assessment of the development of the situation for the next 24/48/72 hours",
       "title": "Initial assessment of the development of the situation for the next 24/48/72 hours"
      },
      {
       "type": "comment",
       "name": "Measures Taken",
       "title": "Measures Taken"
      },
      {
       "type": "text",
       "name": "Resources used (by institutions)",
       "title": "Resources used (by institutions)"
      },
      {
       "type": "text",
       "name": "Material - Technical",
       "title": "Material - Technical"
      },
      {
       "type": "text",
       "name": "Human",
       "title": "Human"
      }
     ],
     "title": "Weather Conditions"
    },
    {
     "type": "text",
     "name": "Care (Number of persons)",
     "title": "Care (Number of persons)"
    },
    {
     "type": "comment",
     "name": "Evacuation",
     "title": "Evacuation",
     "description": "Number of persons, km/ radius, reception centers, etc\n"
    },
    {
     "type": "text",
     "name": "others",
     "title": "Others"
    },
    {
     "type": "text",
     "name": "Help needed to overcome consequences",
     "title": "Help needed to overcome consequences"
    },
    {
     "type": "text",
     "name": "Teams",
     "title": "Teams"
    },
    {
     "type": "text",
     "name": "Materials",
     "title": "Materials"
    },
    {
     "type": "text",
     "name": "Experts",
     "title": "Experts"
    },
    {
     "type": "text",
     "name": "Other relevant details",
     "title": "Other relevant details"
    },
    {
     "type": "comment",
     "name": "Contact Details",
     "title": "Contact Details",
     "description": "24/7, fax, e-mail, web, etc\n"
    }
   ],
   "title": "Earthquake Report"
  }
 ]
}', now());
INSERT INTO public.survey (title, survey, created) VALUES ('Flood Report', '{
 "title": "Flood Report",
 "pages": [
  {
   "name": "page1",
   "elements": [
    {
     "type": "text",
     "name": "Date and time of the report",
     "title": "Date and time of the report",
     "inputType": "datetime-local"
    },
    {
     "type": "multipletext",
     "name": "Date and time of the event / occurrence locally and by GMT",
     "title": "Date and time of the event / occurrence locally and by GMT",
     "items": [
      {
       "name": "Local Time",
       "inputType": "datetime-local",
       "title": "Local Time"
      },
      {
       "name": "GMT",
       "inputType": "datetime",
       "title": "GMT"
      }
     ]
    },
    {
     "type": "comment",
     "name": "Location affected area (City / district / district and geographical coordinates)",
     "title": "Location affected area (City / district / district and geographical coordinates)"
    },
    {
     "type": "comment",
     "name": "Reason for the event / occurrence (spill / slip / torrents)",
     "title": "Reason for the event / occurrence (spill / slip / torrents)"
    },
    {
     "type": "comment",
     "name": "Event description (short and analytical)",
     "title": "Event description (short and analytical)"
    },
    {
     "type": "comment",
     "name": "Tendency of water level (rise / fall)",
     "title": "Tendency of water level (rise / fall)"
    },
    {
     "type": "text",
     "name": "Number of Human Casualties and Injuries",
     "title": "Number of Human Casualties and Injuries",
     "inputType": "number"
    },
    {
     "type": "panel",
     "name": "Material Damage",
     "elements": [
      {
       "type": "comment",
       "name": "Damage to the power grid",
       "title": "Damage to the power grid"
      },
      {
       "type": "comment",
       "name": "Damage to the water supply network",
       "title": "Damage to the water supply network"
      },
      {
       "type": "comment",
       "name": "Damage to the telecommunication networks",
       "title": "Damage to the telecommunication networks"
      },
      {
       "type": "comment",
       "name": "Damage to the traffic infrastructure",
       "title": "Damage to the traffic infrastructure"
      },
      {
       "type": "comment",
       "name": "Damage to buildings and other infrastructure",
       "title": "Damage to buildings and other infrastructure"
      }
     ],
     "title": "Material Damage"
    },
    {
     "type": "panel",
     "name": "panel1",
     "elements": [
      {
       "type": "text",
       "name": "Wind Direction (degrees from)",
       "title": "Wind Direction (degrees from)"
      },
      {
       "type": "text",
       "name": "Wind Speed (m / sec)",
       "title": "Wind Speed (m / sec)"
      },
      {
       "type": "text",
       "name": "Temperature (degrees Celsius)",
       "title": "Temperature (degrees Celsius)"
      },
      {
       "type": "radiogroup",
       "name": "Cloudiness",
       "title": "Cloudiness",
       "isRequired": true,
       "choices": [
        {
         "value": "0",
         "text": "0%"
        },
        {
         "value": "25",
         "text": "25%"
        },
        {
         "value": "50",
         "text": "50%"
        },
        {
         "value": "75",
         "text": "75%"
        },
        {
         "value": "100",
         "text": "100%"
        }
       ]
      },
      {
       "type": "text",
       "name": "Precipitation / Rain-Snow / Amount",
       "title": "Precipitation / Rain-Snow / Amount"
      },
      {
       "type": "comment",
       "name": "Forecast for next 3-5 Days",
       "title": "Forecast for next 3-5 Days"
      },
      {
       "type": "panel",
       "name": "Environmental Parameters",
       "elements": [
        {
         "type": "multipletext",
         "name": "Air Quality (Pollution)",
         "title": "Air Quality (Pollution)",
         "items": [
          {
           "name": "CO2",
           "title": "CO2"
          },
          {
           "name": "NOx",
           "title": "NOx"
          },
          {
           "name": "NO",
           "title": "NO"
          },
          {
           "name": "NO2",
           "title": "NO2"
          },
          {
           "name": "O3",
           "title": "O3"
          },
          {
           "name": "CO",
           "title": "CO"
          },
          {
           "name": "PM10",
           "title": "PM10"
          },
          {
           "name": "PM25",
           "title": "PM2.5"
          }
         ]
        },
        {
         "type": "text",
         "name": "Water Quality (rivers and lakes)",
         "title": "Water Quality (rivers and lakes)"
        },
        {
         "type": "text",
         "name": "Other Environmental Parameters (soil, etc)",
         "title": "Other Environmental Parameters (soil, etc)"
        },
        {
         "type": "comment",
         "name": "Environmental, Food and Feed Monitoring",
         "title": "Environmental, Food and Feed Monitoring"
        }
       ],
       "title": "Environmental Parameters"
      },
      {
       "type": "comment",
       "name": "Initial assessment of the development of the situation for the next 24/48/72 hours",
       "title": "Initial assessment of the development of the situation for the next 24/48/72 hours"
      },
      {
       "type": "comment",
       "name": "Measures Taken",
       "title": "Measures Taken"
      },
      {
       "type": "text",
       "name": "Resources used (by institutions)",
       "title": "Resources used (by institutions)"
      },
      {
       "type": "text",
       "name": "Material - Technical",
       "title": "Material - Technical"
      },
      {
       "type": "text",
       "name": "Human",
       "title": "Human"
      }
     ],
     "title": "Weather Conditions"
    },
    {
     "type": "text",
     "name": "Care (Number of persons)",
     "title": "Care (Number of persons)"
    },
    {
     "type": "comment",
     "name": "Evacuation",
     "title": "Evacuation",
     "description": "Number of persons, km/ radius, reception centers, etc\n"
    },
    {
     "type": "text",
     "name": "Others",
     "title": "Others"
    },
    {
     "type": "text",
     "name": "Help needed to overcome consequences",
     "title": "Help needed to overcome consequences"
    },
    {
     "type": "text",
     "name": "Teams",
     "title": "Teams"
    },
    {
     "type": "text",
     "name": "Materials",
     "title": "Materials"
    },
    {
     "type": "text",
     "name": "Experts",
     "title": "Experts"
    },
    {
     "type": "text",
     "name": "Other Relevant Details",
     "title": "Other Relevant Details"
    },
    {
     "type": "comment",
     "name": "Contact Details",
     "title": "Contact Details",
     "description": "24/7, fax, e-mail, web, etc\n"
    }
   ],
   "title": "Flood Report"
  }
 ]
}', now());