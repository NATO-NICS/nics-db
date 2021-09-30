
-- Drop reset_orgcaps, no longer used
drop function reset_orgcaps;

-- Update to the orgcap functions so that new orgs have all orgcaps disabled, except for General Message
CREATE OR REPLACE FUNCTION new_org_add_caps() RETURNS TRIGGER AS $$
DECLARE capid integer;
DECLARE srcapid integer;
BEGIN
    srcapid=(select cap.capid from cap where cap.name='SR');
    FOR capid IN SELECT cap.capid FROM cap
    LOOP
        if capid = srcapid then
            INSERT INTO orgcap values (DEFAULT,NEW.orgid,capid,'t','t');
        else
		    INSERT INTO orgcap values (DEFAULT,NEW.orgid,capid,'f','f');
        end if;
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;