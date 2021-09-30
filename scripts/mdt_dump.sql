COPY( SELECT
  'unknown',
  id,
  name,
  description,
  course,
  speed,
  NULL,
  extendeddata,
  timestamp,
  NULL,
  ST_SetSRID(ST_MakePoint(ST_X(geom), ST_Y(geom), 0), 3857)
FROM mdt_log) to '/tmp/mdt.dump'; 
