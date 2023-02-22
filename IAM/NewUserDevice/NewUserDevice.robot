*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    Dialogs

*** Variables ***
${current_url}     http://tiger-iam.com/iam-admin/
${username}     sunny@yopmail.com
${password}     123456

*** Test Cases ***
Admin Portal
    Open Portal

*** Keywords ***
Open Portal
    Open Browser    ${current_url}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//header/div[1]/a[1]
    Sleep    2s
    Run Keyword     Login

Login
    Input Text    id=username    ${username}
    Input Password    id=password     ${password}
    Click Button    xpath=//button[contains(text(),'Login')]
    Sleep    2s    

    Execute Javascript    window.open("https://yopmail.com/en/")
    Sleep    3s
    Switch Window    YOPmail - Disposable Email Address - Anonymous and temporary inbox
    Sleep    2s
    Input Text    id=login    ${username}
    Sleep    2s
    Press Keys      id=login    ENTER
    Sleep    5s
    Click Button    id=refresh
    Sleep    2s
    Select Frame    ifmail
    Element Should Contain    xpath=//a[contains(text(),'IAM Unrecognized Login')]    IAM Unrecognized Login

