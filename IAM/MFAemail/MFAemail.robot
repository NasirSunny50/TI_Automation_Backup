*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    Dialogs
Resource    ../ConfirmationEmail/ConfirmationEmail.robot

*** Variables ***
${current_url}     http://tiger-iam.com/iam-admin/
${username}     sunnytigerit123@yopmail.com
${password}     123456

*** Test Cases ***
IAM
    Open Admin Portal
    Login
    Method Select

*** Keywords ***
Open Admin Portal
    Open Browser    ${current_url}     Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//header/div[1]/div[1]/div[1]/div[2]/button[1]/span[3]
    Sleep    2s

Login
    Input Text    id=username    ${username}
    Input Password    id=password     ${password}
    Click Button    xpath=//button[contains(text(),'Login')]
    Sleep    2s
    
Method Select
    Click Element    xpath=//a[contains(text(),'Try another method?')]
    Sleep    2s
    Click Element    xpath=//div[contains(text(),'E-mail')]
    Sleep    2s

#    Click Element    xpath=//a[contains(text(),'Resend OTP')]
#    Sleep    1s

    Execute Javascript    window.open("https://yopmail.com/en/")
    Switch Window       YOPmail - Disposable Email Address - Anonymous and temporary inbox
    Sleep    2s
    Input Text    id=login    ${username}
    Sleep    2s
    Press Keys      id=login    ENTER
    Sleep    5s
    Click Button    id=refresh
    Sleep    2s
    Select Frame    ifmail
    ${otp}=     Get Text    xpath=/html[1]/body[1]/main[1]/div[1]/div[1]/div[1]/div[1]/div[1]/h2[1]/b[1]
    Log     ${otp}
    Switch Window   MFA Verify | IAM
    Sleep    1s
    Input Text    xpath=//input[@id='input-19--0']    ${otp}
    Sleep    1s
    Click Button    xpath=//body/div[@id='app']/div[1]/main[1]/div[1]/div[1]/div[2]/div[1]/div[3]/button[1]
    Sleep    2s
    Page Should Contain Element    xpath=//span[contains(text(),'Applications')]


