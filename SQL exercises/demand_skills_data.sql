SELECT
    skill.skills,
    COUNT(jobs.job_id)
FROM job_postings_fact as jobs
INNER JOIN skills_job_dim as skilljob ON jobs.job_id = skilljob.job_id
INNER JOIN skills_dim as skill ON skilljob.skill_id = skill.skill_id
WHERE jobs.job_title_short = 'Data Analyst'
GROUP BY skill.skills
ORDER BY COUNT(jobs.job_id) DESC
LIMIT 5