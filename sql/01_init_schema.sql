-- =====================================================
-- Project: HR Analytics
-- File: 01_init_schema.sql
-- Purpose: Initialize database schema
-- =====================================================

-- Drop tables if they already exist (safe re-run)
DROP TABLE IF EXISTS recruitments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS jobs CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- =========================
-- Departments table
-- =========================
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- =========================
-- Jobs table
-- =========================
CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL
);

-- =========================
-- Employees table
-- =========================
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    hire_date DATE,
    department_id INT REFERENCES departments(department_id),
    job_id INT REFERENCES jobs(job_id)
);

-- =========================
-- Recruitments table
-- =========================
CREATE TABLE recruitments (
    recruitment_id SERIAL PRIMARY KEY,
    candidate_name VARCHAR(150),
    application_date DATE,
    department_id INT REFERENCES departments(department_id),
    job_id INT REFERENCES jobs(job_id),
    status VARCHAR(50)
);
