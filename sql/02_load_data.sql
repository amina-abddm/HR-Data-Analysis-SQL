-- ==============================================
-- Chargement des données brutes dans les tables
-- =============================================

BEGIN;

-- Modification du format de date pour correspondre aux données
SET datestyle = 'DMY';

\copy raw_employee_data FROM '/Users/aminaabdm/Desktop/HR-Data-Analysis-SQL/data/raw/employee_data.csv' DELIMITER ',' CSV HEADER;
\copy raw_employee_engagement_survey_data FROM '/Users/aminaabdm/Desktop/HR-Data-Analysis-SQL/data/raw/employee_engagement_survey_data.csv' DELIMITER ',' CSV HEADER;
\copy raw_recruitment_data FROM '/Users/aminaabdm/Desktop/HR-Data-Analysis-SQL/data/raw/recruitment_data.csv' DELIMITER ',' CSV HEADER;
\copy raw_training_and_development_data FROM '/Users/aminaabdm/Desktop/HR-Data-Analysis-SQL/data/raw/training_and_development_data.csv' DELIMITER ',' CSV HEADER;

COMMIT;

-- =======================================
-- Vérification du chargement des données
-- =======================================

SELECT COUNT(*) FROM raw_employee_data;
SELECT COUNT(*) FROM raw_employee_engagement_survey_data;
SELECT COUNT(*) FROM raw_recruitment_data;
SELECT COUNT(*) FROM raw_training_and_development_data;
