-- =====================================================
-- Project: HR Analytics
-- File: 01_init_schema.sql
-- Purpose: Initialize database schema
-- =====================================================

-- Drop RAW tables if they already exist (safe re-run)
DROP TABLE IF EXISTS raw_employee_data CASCADE;
DROP TABLE IF EXISTS raw_employee_engagement_survey_data CASCADE;
DROP TABLE IF EXISTS raw_recruitment_data CASCADE;
DROP TABLE IF EXISTS raw_training_and_development_data CASCADE;

-- =========================================
-- RAW schema creation (mirrors CSV files)
-- =========================================

-- =========================
-- Employee table
-- =========================
CREATE TABLE raw_employee_data (
    EmpID INTEGER,
    FirstName TEXT,
    LastName TEXT,
    StartDate DATE,
    ExitDate DATE,
    Title TEXT,
    Supervisor TEXT,
    ADEmail TEXT,
    BusinessUnit TEXT,
    EmployeeStatus TEXT,
    EmployeeType TEXT,
    PayZone TEXT,
    EmployeeClassificationType TEXT,
    TerminationType TEXT,
    TerminationDescription TEXT,
    DepartmentType TEXT,
    Division TEXT,
    DOB DATE,
    State TEXT,
    JobFunctionDescription TEXT,
    GenderCode TEXT,
    LocationCode TEXT,
    RaceDesc TEXT,
    MaritalDesc TEXT,
    PerformanceScore TEXT,
    CurrentEmployeeRating INTEGER
);
-- =========================
-- Employee Engagement Survey Data table
-- =========================
CREATE TABLE raw_employee_engagement_survey_data (
    EmployeeID INTEGER,
    SurveyDate DATE,
    EngagementScore INTEGER,
    SatisfactionScore INTEGER,
    WorkLifeBalanceScore INTEGER
);

-- =========================
-- Recruitment table
-- =========================
CREATE TABLE raw_recruitment_data (
    ApplicantID INTEGER,
    ApplicationDate DATE,
    FirstName TEXT,
    LastName TEXT,
    Gender TEXT,
    DateOfBirth DATE,
    PhoneNumber TEXT,
    Email TEXT,
    Address TEXT,
    City TEXT,
    State TEXT,
    ZipCode TEXT,
    Country TEXT,
    EducationLevel TEXT,
    YearsOfExperience INTEGER,
    DesiredSalary NUMERIC,
    JobTitle TEXT,
    Status TEXT
);


-- ====================================
-- Training and Development Data table
-- ====================================
CREATE TABLE raw_training_and_development_data (
    EmployeeID INTEGER,
    TrainingDate DATE,
    TrainingProgramName TEXT,
    TrainingType TEXT,
    TrainingOutcome TEXT,
    Location TEXT,
    Trainer TEXT,
    TrainingDurationDays INTEGER,
    TrainingCost NUMERIC
);
