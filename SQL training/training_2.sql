

SELECT 
    company_dim.name,
    COUNT(job_postings_fact.job_id) AS jobs
FROM company_dim
LEFT JOIN job_postings_fact
ON company_dim.company_id = job_postings_fact.company_id
GROUP BY company_dim.name
ORDER BY jobs DESC


SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS jobs
FROM skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LEFT JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.job_work_from_home = true AND
        job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_dim.skills, skills_dim.skill_id
ORDER BY jobs DESC
LIMIT 5

-- CTE
WITH remote_job_skills AS (
    SELECT
        COUNT(skills_to_jobs.job_id) AS jobs,
        skills_to_jobs.skill_id
    FROM skills_job_dim as skills_to_jobs
    INNER JOIN job_postings_fact AS job_postings
        ON skills_to_jobs.job_id = job_postings.job_id
    WHERE job_postings.job_work_from_home = true AND 
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY skills_to_jobs.skill_id
)

SELECT
    remote_job_skills.jobs,
    skills_dim.skills
FROM remote_job_skills 
INNER JOIN skills_dim ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY jobs DESC
LIMIT 5

-- UNION
CREATE TABLE february_jobs AS(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
)

SELECT *
FROM (
    SELECT *
    FROM january_jobs
    UNION
    SELECT *
    FROM february_jobs)
WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg