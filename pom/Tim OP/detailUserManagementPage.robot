*** Settings ***
Library            AppiumLibrary
Resource           ../../testScenario/Tim OP/loginPage.robot
Resource           ../../testScenario/Tim OP/userManagement.robot
Library            BuiltIn
Library            ../../venv/Lib/site-packages/robot/libraries/String.py
Resource           ../generalFunction.robot
Resource           userManagementPage.robot


*** Variables ***
${pageDetailUser}                    xpath=//android.widget.TextView[@text="Detail User"]

# Icon Edit
${iconEdit}                          xpath=//android.view.View[contains(@content-desc, "Edit")]/parent::android.view.View

*** Keywords ***
# Update User Management
click icon ubah user management
    Get all random
    Element Should Be Visible    ${pageDetailUser}
    user click element    ${iconEdit}

# Form Ubah User
edit Field
    [Arguments]    ${text}    ${locEdit}    ${locEditText}
    ${loc}    Loc EditText    ${locEditText}
    user click element    ${loc}
    Clear Text    ${loc}
    
    Hide Keyboard
    Get all random
    user input text (EditText)    ${text}     ${locEdit}
