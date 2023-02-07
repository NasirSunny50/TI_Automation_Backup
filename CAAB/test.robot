*** Settings ***
Library    ExcelLibrary

*** Variables ***
${excel_file}    path/to/file.xlsx
${sheet_name}    Sheet1
${row_index}    1
${column_names}    Name    Year    Position

*** Test Cases ***
Example Test
    # Open the Excel file
    Read E    ${excel_file}
    # Read the values from the columns
    ${values}    Create List
    :FOR    ${column_name}    IN    ${column_names}
        ${cell_value}    Get Cell Value    ${sheet_name}    ${row_index}    ${column_name}
        Append To List    ${values}    ${cell_value}
    # Create variables using the column names and values
    Set Variables Using Dictionary    ${column_names}    ${values}
    # You can now use the variables in your test
    Log To Console    Name: ${Name}    Year: ${Year}    Position: ${Position}
    # Remember to close the Excel file
    Close Excel    ${excel_file}




