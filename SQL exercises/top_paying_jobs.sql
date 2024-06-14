COPY (
    SELECT
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
) TO 'C:\\temp\\exercise1.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',');
