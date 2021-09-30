COPY mobiledevicetrack_log (
  deviceid,
  username,
  name,
  description,
  course,
  speed,
  accuracy,
  extendeddata,
  timestamp,
  workspaceid,
  location
) FROM '/tmp/mdt.dump';
