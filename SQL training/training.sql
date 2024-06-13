-- A bunch of code to practice

SELECT 
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date_time,
    job_posted_date::DATE as date,
    EXTRACT(MONTH FROM job_posted_date) as month
FROM job_postings_fact
LIMIT 10

SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY month

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3

SELECT *
    FROM january_jobs

-- CASE EXPRESSION

SELECT
    job_title_short,
    job_location
FROM job_postings_fact

SELECT
    COUNT(job_id),
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite' 
    END AS new_location
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY new_location

-- continue at 2:30:27

-- subqueries

SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs2

WITH january_jobs2 AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs2

SELECT * 
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE job_no_degree_mention = false
) AS jobs_nodegree


WITH nodegree AS (
    SELECT *
    FROM job_postings_fact
    WHERE job_no_degree_mention = false
)

SELECT
    nodegree.job_title_short,
    company_dim.name,
    nodegree.job_no_degree_mention
    FROM nodegree
    RIGHT JOIN company_dim
    ON nodegree.company_id = company_dim.company_id

SELECT name AS name
FROM company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM job_postings_fact 
    WHERE job_no_degree_mention = false
)
