*** Settings ***
Resource    ../resources/db_connection.robot

*** Test Cases ***
TC_JOBS_MIN_LESS_THAN_MAX
    [Documentation]    Verify that for each job, min_salary is less than max_salary
    Connect To TRN Database
    ${results}=    Query    SELECT job_id, min_salary, max_salary FROM hr.jobs
    FOR    ${row}    IN    @{results}
        Should Be True    ${row}[1] < ${row}[2]
    END
    Disconnect From TRN Database


TC_JOBS_UNIQUE_TITLES
    [Documentation]    Verify that each job title is unique (no duplicates)
    Connect To TRN Database
    ${sql}=    Set Variable    SELECT job_title, COUNT(*) AS title_count FROM hr.jobs GROUP BY job_title HAVING COUNT(*) > 1
    ${results}=    Query    ${sql}
    ${row_count}=    Get Length    ${results}
    Should Be Equal As Integers    ${row_count}    0
    Disconnect From TRN Database





