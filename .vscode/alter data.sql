ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'victor'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'marcos'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'jarbas'
WHERE job_id = 3; 

UPDATE job_applied
SET contact = 'faceuto'
WHERE job_id = 4; 

UPDATE job_applied
SET contact = 'jungli'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO name; 

ALTER TABLE job_applied
ALTER COLUMN name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN name;

DROP TABLE job_applied;

SELECT *
from job_applied