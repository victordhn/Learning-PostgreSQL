CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied 
            (job_id, 
            application_sent_date, 
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)

VALUES  (1,
        '2024-02-01',
        false,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'
        ),

        (2,
        '2024-02-01',
        false,
        'resume_02.pdf',
        true,
        'cover_letter_02.pdf',
        'submitted'
        ),

        (3,
        '2024-02-01',
        true,
        'resume_03.pdf',
        false,
        NULL,
        'rejected'
        ),

        (4,
        '2024-02-01',
        true,
        'resume_04.pdf',
        true,
        'cover_letter_04.pdf',
        'accepted'
        ),

        (5,
        '2024-02-01',
        true,
        'resume_05.pdf',
        true,
        'cover_letter_05.pdf',
        'rejected'
        );

SELECT *
FROM job_applied