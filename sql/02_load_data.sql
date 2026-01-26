BEGIN;

\copy employees FROM 'data/raw/employees.csv' DELIMITER ',' CSV HEADER;
\copy employees_engagement_survey_data FROM 'data/raw/employees_engagement_survey_data.csv' DELIMITER ',' CSV HEADER;
\copy recruitment_data FROM 'data/raw/recruitment_data.csv' DELIMITER ',' CSV HEADER;
\copy training_and_development_data FROM 'data/raw/training_and_development_data.csv' DELIMITER ',' CSV HEADER;

COMMIT;

SELECT COUNT(*) AS employee_count FROM employees;
SELECT COUNT(*) AS engagement_survey_count FROM employees_engagement_survey_data;
SELECT COUNT(*) AS recruitment_data_count FROM recruitment_data;
SELECT COUNT(*) AS training_data_count FROM training_and_development_data;


