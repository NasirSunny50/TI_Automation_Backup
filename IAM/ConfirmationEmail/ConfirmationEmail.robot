*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    Dialogs
Library     OperatingSystem

*** Variables ***

${firstname}    IAM
${lastname}     Test
${password}     123456

*** Test Cases ***
IAM
    Open Admin Portal


*** Keywords ***
Open Admin Portal
    Open Browser    http://tiger-iam.com/iam-admin/      Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//header/div[1]/div[1]/div[1]/div[2]/button[1]/span[3]
    Sleep    2s
    Run Keyword    Sign Up

Sign Up
    ${output}=  Run And Return Rc And Output  python RandomEmail.py
    ${email}=  Set Variable  ${output[1]}
    Click Element    xpath=//a[@id='signup']
    Sleep    1s
    Input Text    xpath=//input[@id='firstname']    ${firstname}
    Sleep    1s
    Input Text    xpath=//input[@id='lastname']    ${lastname}
    Sleep    1s
    Input Text    xpath=//input[@id='email']    ${email}
    Sleep    1s
    Input Text    xpath=//body/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[4]/input[1]   ${password}
    Sleep    1s
    Input Text    id=confirm_password    ${password}
    Sleep    1s
    Click Button    xpath=//button[contains(text(),'Create Account')]

    Execute Javascript    window.open("https://yopmail.com/en/")
    Switch Window       YOPmail - Disposable Email Address - Anonymous and temporary inbox
    Sleep    2s
    Input Text    id=login    ${email}
    Sleep    2s
    Press Keys      id=login    ENTER
    Sleep    5s
    Click Button    id=refresh
    Sleep    2s
    Select Frame    ifmail
    Click Element    xpath=//a[contains(text(),'Confirm Email')]
    Sleep    2s

#    Switch Window   LOCATOR=index=3
#    Page Should Contain Element    xapth=/html/body