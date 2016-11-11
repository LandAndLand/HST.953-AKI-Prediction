﻿-- Create a table with MAP measurements for each patient

DROP MATERIALIZED VIEW IF EXISTS map;
CREATE MATERIALIZED VIEW map AS(

SELECT DISTINCT icustay_id, EXTRACT(epoch FROM charttime) as charttime, itemid, valuenum
FROM chartevents
WHERE valuenum IS NOT NULL AND itemid IN (220181, 220052, 225312, 224322, 6702, 443, 52, 456) 
ORDER BY icustay_id, charttime, itemid
);