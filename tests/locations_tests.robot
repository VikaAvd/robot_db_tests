*** Settings ***
Resource    ../resources/db_connection.robot

*** Test Cases ***
TC_LOCATIONS_NOT_NULL_CITY
    [Documentation]    Verify city is not NULL in any location
    Connect To TRN Database
    ${results}=    Query    SELECT COUNT(*) FROM hr.locations WHERE city IS NULL;
    Should Be Equal As Integers    ${results[0][0]}    0
    Disconnect From TRN Database

TC_LOCATIONS_COUNTRY_ID_LENGTH
    [Documentation]    Verify country_id is exactly 2 characters
    Connect To TRN Database
    ${results}=    Query    SELECT COUNT(*) FROM hr.locations WHERE LEN(country_id) <> 2;
    Should Be Equal As Integers    ${results[0][0]}    0
    Disconnect From TRN Database
