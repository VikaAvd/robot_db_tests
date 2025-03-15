# Robot Framework MSSQL Database Tests

This project contains automated tests using Robot Framework for verifying data in a Microsoft SQL Server database. The tests cover validations on three tables in the `TRN` database under the `hr` schema.

## Table of Contents
- [Overview](#overview)
- [Test Cases Description](#test-cases-description)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Tests](#running-the-tests)
- [Test Reports](#test-reports)
- [Troubleshooting](#troubleshooting)

## Overview
This project uses Robot Framework along with the DatabaseLibrary to connect to a SQL Server instance, execute queries, and validate data in the following tables:
- `[TRN].[hr].[employees]`
- `[TRN].[hr].[jobs]`
- `[TRN].[hr].[locations]`


## Test Cases Description
The project implements six test cases (two per table):

**Employees Table:**
- **TC_EMPLOYEE_COUNT:** Verifies that the total number of employees in the `[hr].[employees]` table is greater than zero.
- **TC_EMPLOYEE_AVG_SALARY:** Verifies that the average salary in the `[hr].[employees]` table is within an expected range.

**Jobs Table:**
- **TC_JOBS_MIN_LESS_THAN_MAX:** Confirms that for each job in `[hr].[jobs]`, the `min_salary` is less than the `max_salary`.
- **TC_JOBS_UNIQUE_TITLES:** Ensures that every job title in `[hr].[jobs]` is unique (no duplicates).

**Locations Table:**
- **TC_LOCATIONS_NOT_NULL_CITY:** Validates that the `city` column in the `[hr].[locations]` table does not contain NULL values.
- **TC_LOCATIONS_COUNTRY_ID_LENGTH:** Checks that the `country_id` in the `[hr].[locations]` table is exactly 2 characters long.


## Prerequisites
- **Python 3.8+** (Tested with Python 3.12)
- **Robot Framework**
- **Robot Framework DatabaseLibrary**
- **pyodbc**
- A running **Microsoft SQL Server** instance with the `TRN` database and `hr` schema.
- The correct **ODBC Driver 17 for SQL Server** installed (64-bit recommended).
- A database login (e.g., `robot`) with appropriate permissions on the `TRN` database.

## Project Structure
robot_db_tests/
├── output/                       # Folder where test reports (log.html, report.html) are generated
├── resources/
│   └── db_connection.robot       # Contains database connection keywords
├── tests/
│   ├── employees_tests.robot     # Tests for the employees table
│   ├── jobs_tests.robot          # Tests for the jobs table
│   └── locations_tests.robot     # Tests for the locations table
├── README.md                     # Project instructions
└── requirements.txt              # List of required Python packages


## Installation
1. **Clone the Repository**  
   git clone https://github.com/VikaAvd/robot_db_tests.git
   cd robot_db_tests

2. **Install Python Dependencies**
- Ensure you have Python installed, then run:
- pip install robotframework robotframework-databaselibrary pyodbc

## Configuration
1. **Database Connection**
- The file resources/db_connection.robot contains the keyword for connecting to the SQL Server database. 
- It is configured as follows:
      Database Name: TRN
      Username: robot
      Password: Vika_password123
      Server: EPUALVIW059D\SQLEXPRESS01
      Port: (Use the actual port your SQL Server instance listens on, e.g., 52298)
      If your SQL Server uses dynamic ports, update the port number in db_connection.robot accordingly.

2. **SQL Server Requirements**
- Ensure TCP/IP is enabled for your SQL Server instance.
- The SQL Server Browser service should be running.
- The robot login must have proper permissions (e.g., db_datareader) on the TRN database.

## Running the Tests
- Run all tests from the project root using the following command (ensure you’re using the correct Python environment):
   python -m robot --outputdir output tests

- Or, for a specific test file:
   python -m robot --outputdir output tests/db_check.robot
Note: If you have spaces in your file paths, enclose the paths in quotes.

## Test Reports
After execution, the following files will be generated in the output/ folder:
- log.html: Detailed logs with keyword-level execution details.
- output.xml: An XML file with the test results.
- report.html: A summary report of the test run.

## Troubleshooting
Connection Issues:
- If you receive errors such as “Data source name not found” or “actively refused,” verify that:
   - The correct ODBC driver is installed and visible to Python.
   - TCP/IP is enabled on your SQL Server instance.
   - SQL Server Browser is running.
   - The port number in db_connection.robot is correct 
      (you can check this in SQL Server Configuration Manager or with a T-SQL query).

- Test Failures:
   - Review output/log.html for detailed error messages to identify which validation failed.