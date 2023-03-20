*** Settings ***
Library     Process
Library     RequestsLibrary

*** Variables ***
${baseurl}    http://tiger-iam.com/iam
${python}     python
${oauth_script}   oauth.py

*** Test Cases ***
Run Python Script
    ${result}=    Run Process    ${python}    ${oauth_script}
    ${bearerToken}=    Set Variable    ${result.stdout}
    Set Global Variable    ${bearerToken}
    Log To Console    ${bearerToken}

get mfa settings test
    ${headers}=    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    ${response}=    GET    ${baseurl}/admin/settings/mfa    headers=${headers}
    ${status code}=    Convert To String    ${response.status_code}
    Log To Console    ${status_code}
    Log To Console    ${response.content}
    Should Be Equal    ${status_code}    200

get properties settings test
    ${headers}=    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    ${response}=    GET    ${baseurl}/admin/settings/properties    headers=${headers}
    ${status code}=    Convert To String    ${response.status_code}
    Log To Console    ${status_code}
    Log To Console    ${response.content}
    Should Be Equal    ${status_code}    200

