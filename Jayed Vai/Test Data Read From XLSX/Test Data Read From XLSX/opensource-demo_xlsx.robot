*** Settings ***
Documentation    Data Driven Test
Library  SeleniumLibrary
Library    DataDriver    ./TS1.xlsx    sheet_name=Sheet1
Suite Setup    Login First
Suite Teardown    Logout Last
Test Template    Search


*** Variables ***
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}  Chrome
${Valid_User}    Admin
${Valid_Pass}    admin123


*** Test Cases ***
Search as ${Name} and ${Country}

*** Keywords ***
Login First
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    10s
    Input Text    name:username    ${Valid_User}
    Sleep    2s
    Input Text    name:password     ${Valid_Pass}
    Sleep    2s
    Click Button    xpath://*[@id="app"]//button[@type='submit' and contains(., ' Login ')]
    Sleep    2s
    Wait Until Page Contains Element    xpath://*[@id="app"]//span/h6[contains(., 'Dashboard')]   20s
    Location Should Be   https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index

 Search
    [Arguments]    ${Name}    ${Country}
    Go Directory Page
    Sleep    2s
    Type Name   ${Name}
    Sleep    2s
    Type Country   ${Country}
    Sleep    5s
    Click Element    css=.oxd-button--secondary
    Sleep    2s
    Verify Search Result    ${Name} 

Go Directory Page
    Click Element    xpath://*[@id="app"]//a/span[contains(., 'Directory')]
    Sleep    5s
    Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/directory/viewDirectory
    Sleep    2s

 Type Name
    [Arguments]    ${Name}
    Input Text    css:input[placeholder="Type for hints..."]     ${Name} 
    #Press Keys    css:input[placeholder="Type for hints..."]     ${Name}
    Sleep    2s
Type Country 
    [Arguments]    ${Country}
    Click Element    xpath=//div[3]/div/div[2]/div/div/div
    Sleep    2s
    
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]//*[contains(text(), "${Country}")]
    Sleep    2s

Verify Search Result
    [Arguments]    ${Name}
    Element Text Should Be    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div/div[2]/div/div/div/p[1]    ${Name}
  
Logout Last
    Click Element    css=.oxd-userdropdown-icon
    Sleep    2s
    Click Element    //*[@id="app"]//a[@href="/web/index.php/auth/logout"]
    Sleep    3s
    Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    