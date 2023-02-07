*** setting ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Test Cases ***
Login
    ${email}=    Get File    email.txt
    Open Browser    http://192.168.4.94:8082/evisa-portal/    chrome
    Maximize Browser Window
    Click Element    xpath=//a[@href='/evisa-portal/oauth2/authorization/iam']
    Sleep    2s
    Input Text    id=username    ${email}
    Sleep    1s
    Input Text    id=password    123456
    Sleep    50s