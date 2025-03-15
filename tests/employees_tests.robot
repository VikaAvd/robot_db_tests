*** Settings ***
Resource    ../resources/db_connection.robot

*** Test Cases ***
TC_EMPLOYEE_COUNT
    [Documentation]    Verify the total number of employees is greater than zero
    Connect To TRN Database
    ${result}=    Query    SELECT COUNT(*) FROM hr.employees;
    # Query returns a table of rows. Access the first row, first column:
    Should Be True    ${result[0][0]} > 0
    Disconnect From TRN Database

TC_EMPLOYEE_AVG_SALARY
    [Documentation]    Verify average salary is within expected range (e.g., 1000-20000)
    Connect To TRN Database
    ${result}=    Query    SELECT AVG(salary) FROM hr.employees;
    ${avg_salary}=    Set Variable    ${result[0][0]}
    Should Be True    ${avg_salary} >= 1000
    Should Be True    ${avg_salary} <= 20000
    Disconnect From TRN Database
