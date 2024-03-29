*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    RPA.Crypto
Library    String
Variables    Access.py
Variables    ${CURDIR}/Data/data.py
Variables    ${CURDIR}/Data/url.py
Variables    ${CURDIR}/Data/data.py
Resource    ${CURDIR}/Resources/common_1.robot



*** Keywords ***
Login Application
    [Documentation]    Using this keyword we can login Productor Application.
    [Arguments]    ${username}
    ${json_data}    Get File    Data/password.json
    ${object}=    Evaluate    json.loads('''${json_data}''')    json
    ${encry}    Set Variable    ${object['${username}']}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys,selenium.webdriver
    Call Method    ${options}    add_argument    inprivate
    ${driver}    Create Webdriver    Edge    options=${options} 
    Go To    ${Productor_Url}
    Maximize Browser Window
    Set Selenium Speed    0.1
    Wait Until Page Contains Element    ${Input_Username}    50
    Press Keys    ${Input_Username}    ${username}
    Use Encryption Key    ${public_key}
    ${Decry} =  Decrypt String    ${encry}
    Log    ${Decry}
    Press Keys    ${Input_Password}    ${Decry}
    # Wait Until Element is present then click the element    ${BTN_Login}


    