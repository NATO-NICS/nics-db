
-- Increase the size of the internalurl column to handle long urls
-- like long token params on arcgis urls
ALTER TABLE datasource ALTER COLUMN internalurl TYPE VARCHAR(512);
