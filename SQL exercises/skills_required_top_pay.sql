COPY (
WITH topjob AS (
    SELECT
        job_id,
        name,
        job_title,
        salary_year_avg,
        job_title_short
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = true
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    name,
    job_title,
    skills,
    salary_year_avg
    FROM topjob
    INNER JOIN skills_job_dim ON topjob.job_id = skills_job_dim.job_id 
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    ORDER BY salary_year_avg DESC
) TO 'C:\\temp\exercise2.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER)