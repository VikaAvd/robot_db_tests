*** Settings ***
Library    DatabaseLibrary

*** Keywords ***
Connect To TRN Database
    Connect To Database    pyodbc    TRN    robot    Vika_password123    EPUALVIW059D\\SQLEXPRESS01    52298    None    driver={ODBC Driver 17 for SQL Server}
    # Explanation (change these values according to your environment):
    # 1) pyodbc                  => DB API module name
    # 2) TRN                     => Database name
    # 3) robot                   => DB username
    # 4) Vika_password123        => DB password
    # 5) EPUALVIW059D\\SQLEXPRESS01 => Host/instance (double backslash)
    # 6) 52298                   => Port (set to None if using dynamic port via SQL Browser)
    # 7) None                    => Charset (if applicable; otherwise, None)
    # 8) driver={ODBC Driver 17 for SQL Server} => Explicit driver specification

Disconnect From TRN Database
    Disconnect From Database
