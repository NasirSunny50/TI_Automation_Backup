*** Settings ***
Library     SeleniumLibrary
Library    Dialogs
Library    Process


*** Variables ***
${email}      abc@gmail.com
${confirm_email}    ${email}
${captcha}      xpath=//tbody/tr[4]/td[2]/div[1]/img[1]

*** Test Cases ***
login
    Agreement
    Login

*** Keywords ***
Agreement
    Open Browser    https://www.visa.gov.bd/    chrome
    Maximize Browser Window
    Select Checkbox   xpath=//input[@id='ctl00_C1_wz_Chk']
    Sleep    2s
    Click Button    xpath=//input[@id='ctl00_C1_wz_StartNavigationTemplateContainerID_StartNextButton']

Login
    Input Text    xpath=//input[@id='ctl00_C1_wz_txtEmailAdd']      ${email}
    Input Text    xpath=//input[@id='ctl00_C1_wz_txtConfirmEmailAdd']    ${confirm_email}
    Sleep    1s
    Page Should Contain Image    ${captcha}
    Element Should Be Visible    ${captcha}
    ${image_url}=  Get Element Attribute  ${captcha}  src
    log to console  ${image_url}
    Run Process  curl  -o  captcha.png  ${image_url}
    ${value}    Get Value From User    Insert your Captcha
    Input Text    id=ctl00_C1_wz_txtSecCode    ${value}
#    Execute Manual Step     Please complete the CAPTCHA portion of the form.
    Click Button    xpath=//input[@id='ctl00_C1_wz_StartNavigationTemplateContainerID_StartNextButton']



    

