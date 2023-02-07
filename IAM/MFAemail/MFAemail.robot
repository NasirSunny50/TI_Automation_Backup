*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    Dialogs

*** Variables ***
${current_url}     http://evisa.tiger-iam.com/iam/authenticate
${username}     sunnytigerit123@yopmail.com
${password}     123456

*** Test Cases ***
Evisa
    Open Evisa

*** Keywords ***
Open Evisa
    Open Browser    http://192.168.4.94:8082/evisa-portal/      Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//header/div[1]/nav[1]/ul[1]/li[7]/a[1]
    Sleep    2s
    Run Keyword     Login

Login
    Input Text    id=username    ${username}
    Input Password    id=password     ${password}
    Click Button    xpath=//button[contains(text(),'Login')]
    Sleep    2s
    Run Keyword    Method Select
    
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
    Page Should Contain Element    xpath=//h4[contains(text(),'List of Applications')]


