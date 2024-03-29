*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    Dialogs

*** Variables ***
${current_url}     http://tiger-iam.com/iam-admin/
${email}    sunnytigerit123@yopmail.com

*** Test Cases ***
IAM
    Open Admin Portal
    Forgot Password
    Check Email
    Change Password

*** Keywords ***
Open Admin Portal
    Open Browser    ${current_url}      Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//header/div[1]/div[1]/div[1]/div[2]/button[1]/span[3]
    Sleep    2s
    # Run Keyword    Forgot Password

Forgot Password
    Click Element    xpath=//a[contains(text(),'Forgot password?')]
    Sleep    3s
    Input Text    xpath=//input[@id='email']    sunnytigerit123@yopmail.com
    Sleep    2s
    Click Button    xpath=//body/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]  
    Sleep    3s
    Element Should Contain    xpath=//div[@id='message']    An email has been sent to this email address 
    Sleep    3s
    # Run Keyword    Check Email

Check Email
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
    Click Element    xpath=//a[contains(text(),'Reset Password')]
    Sleep    3s
    
Change Password
    Switch Window    IAM : Login
    Sleep    3s
    Log Title


    