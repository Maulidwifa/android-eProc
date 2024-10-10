*** Settings ***
Library        AppiumLibrary
Resource       ../config/openApp.robot

*** Variables ***
${titleLogin}                  xpath=//android.widget.TextView[@text="Login"]
${inputNoHandphone}            xpath=//android.widget.EditText[1]
${inputPassword}               xpath=//android.widget.EditText[2]
${buttonMasuk}                 xpath=//android.view.View/android.view.View[2]
${errorMessage_NoHandphone}    xpath=//android.widget.TextView[contains(@text, "No.")][2]
${errorMessage_Password}       xpath=//android.widget.TextView[contains(@text, "Password")][2]
${errMandatory_Login}          xpath=//android.widget.TextView[contains(@text,"harus diisi")]

*** Keywords ***
user input no handphone
    [Arguments]    ${noHandphone}
    Wait Until Element Is Visible    ${titleLogin}
    Input Text    ${inputNoHandphone}    ${noHandphone}

user input password
    [Arguments]    ${password}
    Input Password    ${inputPassword}    ${password}

click button masuk
    Click Element    ${buttonMasuk}

home Project
    Wait Until Element Is Visible    accessibility_id=Icon Projects    timeout=10s
    Element Should Be Visible    accessibility_id=Icon Projects
    Element Should Be Visible    accessibility_id=Notification
    Element Should Be Visible    accessibility_id=Icon Search
    
error message
    Wait Until Element Is Visible    ${titleLogin}
    ${ress}    Run Keyword And Return Status    Wait Until Element Is Visible    ${errorMessage_NoHandphone}
    WHILE    ${ress}
        IF    ${ress}
            ${textError}    Get Text    ${errorMessage_NoHandphone}
            Log To Console    ${\n}Error Message : ${textError}
            ${ress}    Run Keyword And Return Status    Wait Until Element Is Visible    ${errorMessage_Password}
            IF    ${ress}
                ${textError}    Get Text    ${errorMessage_Password}
                Log To Console    ${\n}Error Message : ${textError}
                BREAK
            END
        ELSE
            ${textError}    Get Text    ${errorMessage_Password}
            Log To Console    ${\n}Error Message : ${textError}
        END
    END

err phone and password
    ${len}    Get Length    ${errMandatory_Login}
    FOR    ${counter}    IN RANGE    ${len}
        ${textErr}    Get Text    ${errMandatory_Login}[${counter}]
        Log To Console    ${\n}Error Message : ${textErr}
    END