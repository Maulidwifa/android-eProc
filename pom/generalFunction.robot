*** Settings ***
Library            AppiumLibrary
Resource           ../testScenario/Tim OP/loginPage.robot
Library            BuiltIn

*** Keywords ***
# General Funct
Loc Parent View
    [Arguments]    ${text}
    ${loc}    Set Variable    xpath=//android.widget.TextView[@text="${text}"]/parent::android.view.View
    RETURN    ${loc}

Loc Parent EditText
    [Arguments]    ${text}
    ${loc}    Set Variable    xpath=//android.widget.TextView[@text="${text}"]/parent::android.widget.EditText
    RETURN    ${loc}
    
Loc EditText
    [Arguments]    ${text}
    ${loc}    Set Variable    xpath=//android.widget.EditText[@text="${text}"]
    RETURN    ${loc}

Generate Simple Random Name
    ${name}    Evaluate    ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ', k=5)) + ' ' + ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ', k=8))    modules=random
    Set Global Variable    ${randomStr}    ${name}

Generate Random Email
    ${name}    Evaluate    ''.join(random.choices('abcdefghijklmnopqrtuvwxyz', k=8))    modules=random
    ${nameEmail}    Set Variable    ${name}@gmail.com
    Set Global Variable    ${randomEmail}    ${nameEmail}

Generate Random Comp
    ${name_part1}    Evaluate    ''.join(chr(random.randint(65, 90)) for _ in range(5))    modules=random
    ${name_part2}    Evaluate    ''.join(chr(random.randint(65, 90)) for _ in range(3)) + ' Corp'    modules=random
    ${company_name}    Set Variable    ${name_part1} ${name_part2}
    Log    Random Company Name: ${company_name}
    RETURN    ${company_name}

Generate Random Phone Number
    # Generate random number with prefix '08'
    ${random_number} =    Evaluate    '08' + str(random.randint(10000000, 99999999))
    Set Global Variable    ${randNumber}    ${random_number}

Random Get Name User Management
    # ${elements} =    Get Webelements    xpath=//android.widget.TextView[@text="Nomor handphone"]
    ${len}    Get Length    xpath=//android.widget.TextView[@text="Nomor handphone"]
    ${randomIndex}    Evaluate    random.randint(0, ${len} - 1)
    RETURN    ${random_index}

# Function Input EditText
input text (EditText)
    [Arguments]    ${rand_text}    ${locEdit}
    ${loc}    Loc Parent EditText    ${locEdit}
    Input Text    ${loc}    ${rand_text}

user input text (EditText)
    [Arguments]    ${text}    ${locEditext}
    input text (EditText)    ${text}    ${locEditext}

input password form user management
    [Arguments]    ${password}    ${locatorText}
    ${loc}    Loc Parent EditText    ${locatorText}
    Swipe    ${521}    ${1798}    ${530}    ${1207}
    Input Text    ${loc}    ${password}

# Function Click
user click element
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

click alert parent View
    [Arguments]    ${locator}    ${btn}
    Wait Until Element Is Visible    ${locator}
    ${loc}    Loc Parent View    ${btn}
    Click Element    ${loc}

user click button (parent view)
    [Arguments]    ${btn}
    ${loc}    Loc Parent View    ${btn}
    Click Element    ${loc}

alert pop up show
    [Arguments]    ${icon}    ${alertText}    ${descText}    ${loc_btn_alert}    ${btn_click}
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${icon}
    IF    ${res}
        ${textTitle}    Get Text    ${alertText}
        ${textDesc}     Get Text    ${descText}
        click alert parent View    ${loc_btn_alert}    ${btn_click}
        Log To Console    Title PopUp: ${textTitle}
        Log To Console    Desc PopUp: ${textDesc}
    END

scroll down per card section
    Swipe    ${504}    ${1060}    ${504}    ${543}

Get all random
    Generate Simple Random Name
    Generate Random Phone Number
    Generate Random Email

# Function Edit Text (EditText)
edit Field (Edit Text)
    [Arguments]    ${text}    ${locEdit}    ${locEditText}
    ${loc}    Loc EditText    ${locEditText}
    user click element    ${loc}
    Clear Text    ${loc}
    Get all random
    user input text (EditText)    ${text}     ${locEdit}
