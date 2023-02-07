*** setting ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String



*** Test Cases ***
Login
    Open Browser    http://192.168.4.94:8082/evisa-portal/    chrome
    Maximize Browser Window
    Click Element    xpath=//a[@href='/evisa-portal/oauth2/authorization/iam']
    Sleep    2s
    Input Text    id=username    raihan1@yopmail.com
    Sleep    1s
    Input Text    id=password    123456
    Sleep    1s
    Click Button    xpath=//button[@type='submit']
    Sleep    1s
    Click Element    xpath=//a[contains(text(),'Try another method?')]
    Sleep    2s
    Click Element    xpath=//div[contains(text(),'E-mail')]
    Sleep    2s
    Execute JavaScript    window.open('https://yopmail.com/en/', '_blank')
    Sleep    2s
    ${handles}=    Get Window Handles
    Switch Window    ${handles[1]}
    Sleep    3s
    Input Text    xpath=//input[@id='login']    raihan1
    Click Element    xpath=//i[contains(text(),'')]
    Sleep    7s
    Click Element    xpath=//iframe[@id='ifinbox']    
    Sleep    2s
    ${otp}=    Get Text    //iframe[@id='ifmail']
    Sleep    3s
    Switch Window    ${handles[0]}
    Log    ${otp}
    #Input Text    xpath=//input[@id='input-9--0']    ${otp}



# Test Case
#     Open Browser    https://www.google.com    chrome
#     # Open a new tab
#     Execute JavaScript    window.open('https://yopmail.com/en/', '_blank')
#     ${handles}=    Get Window Handles
#     Switch Window    ${handles[1]}
#     Sleep    3s
#     # Perform actions in the new tab
#     Switch Window    ${handles[0]}
#     Sleep    3s
#     # Perform actions in the original tab





