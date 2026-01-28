-- 03_analysis.sql
-- Objectif : Analyser l'efficacité du recrutement et ses impacts RH


-- =====================================
-- 1. Taux de conversion du recrutement
-- =====================================
SELECT
    COUNT(DISTINCT r.applicantid) AS total_candidates,
    COUNT(DISTINCT e.empid) AS hired_employees,
    ROUND(
        COUNT(DISTINCT e.empid)::numeric
        / COUNT(DISTINCT r.applicantid) * 100,
        2
    ) AS conversion_rate_percent
FROM raw_recruitment_data r
LEFT JOIN raw_employee_data e
    ON r.applicantid = e.empid;

-- Résultat : Le taux de conversion global des candidats en employés embauchés est de 100 %.
-- Cela suggère que le jeu de données ne contient pas de candidats non embauchés. 
-- L’analyse du recrutement est donc limitée par la structure des données disponibles.

-- =====================================
-- 2. Analyse des sources de recrutement
-- =====================================

-- Le KPI de source de recrutement n’a pas pu être calculé car la variable n’est pas présente dans le jeu de données. 
-- Cela montre l’importance de la qualité et de la complétude des données en amont.
-- Cependant, nous pouvons versionner une analyse alternative avec education_level comme proxy.

SELECT
    r.educationlevel AS recruitment_source,
    COUNT(DISTINCT r.applicantid) AS total_candidates,
    COUNT(DISTINCT e.empid) AS hired_employees,
    ROUND(
        COUNT(DISTINCT e.empid)::numeric
        / COUNT(DISTINCT r.applicantid) * 100,
        2
    ) AS conversion_rate_percent
FROM raw_recruitment_data r
LEFT JOIN raw_employee_data e
    ON r.applicantid = e.empid
GROUP BY r.educationlevel
ORDER BY hired_employees DESC;  

-- ==============================================
-- 3. Engagement des employés par education level
-- ===============================================

SELECT
    r.educationlevel AS education_level,
    AVG(engagementscore) AS avg_engagement_score
FROM raw_recruitment_data r
JOIN raw_employee_data e
    ON r.applicantid = e.empid
JOIN raw_employee_engagement_survey_data    
    ON e.empid = employeeid
GROUP BY r.educationlevel
ORDER BY avg_engagement_score DESC; 

-- Resultat : Les scores moyens d’engagement des employés sont très proches quel que soit le niveau d’éducation.
-- Cela suggère l’absence de corrélation forte entre le niveau académique et l’engagement des employés. 
-- L’engagement semble donc davantage influencé par d’autres facteurs organisationnels que par le niveau d’études.


-- ====================================================================
-- 4. Analyse de l'impact de la formation sur l'evolution de carrière
-- ====================================================================

SELECT
    r.educationlevel AS education_level,
    COUNT(t.trainingprogramname) AS avg_career_progression_proxy
FROM raw_recruitment_data r
JOIN raw_employee_data e
    ON r.applicantid = e.empid
JOIN raw_training_and_development_data t
    ON e.empid = t.employeeid
GROUP BY r.educationlevel
ORDER BY avg_career_progression_proxy DESC;

-- Resultat : Le nombre moyen de programmes de formation suivis par les employés est similaire quel que soit le niveau d’éducation.
-- La progression de carrière (approximée par la formation) semble davantage liée à des facteurs internes (poste, besoins métiers, politique RH) qu’a la formation initiale.

-- 
