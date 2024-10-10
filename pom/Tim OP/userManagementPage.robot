*** Settings ***
Library            AppiumLibrary
Resource           ../../testScenario/Tim OP/loginPage.robot
Library            BuiltIn
Library            ../../venv/Lib/site-packages/robot/libraries/String.py
Resource           ../generalFunction.robot

*** Variables ***
${menuUserManagement}            xpath=//android.widget.TextView[@text="User Management"]/parent::android.view.View
${addUserManagement}             xpath=//android.widget.TextView[@text="Tambah User"]/parent::android.view.View
${textUploadFile}                xpath=//android.widget.ScrollView//following-sibling::android.widget.TextView[contains(@text, "upload file")]
${popUP_tambahUserManagement}    xpath=//android.widget.TextView[@text="Tambah User"]
${totalProject}                  xpath=//android.widget.ImageView[@content-desc="Icon Projects"]//following-sibling::android.widget.TextView[2]
${listUserManagement}            xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
${alertTitle}                    xpath=//android.widget.TextView[contains(@text, "User")]
${descTitle}                     xpath=//android.widget.ImageView/parent::android.view.View/android.widget.TextView[2]
${pageDetailUser}                xpath=//androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View
${textDetailUser}                xpath=//android.widget.TextView[@text="Detail User"]
${btn_UbahPassword}              xpath=(//android.view.View[@content-desc="Image"])/parent::android.view.View

# Error State Form User Management
${errState}                      xpath=//android.widget.TextView[contains(@text, "harus")]
${passVerify}                    xpath=//android.widget.TextView[@text="Password sesuai"]
${notPassVerif}                  xpath=//android.widget.TextView[@text="Konfirmasi password tidak sesuai"]
${hasRegistered}                 xpath=//android.widget.TextView[contains(@text, "terdaftar")]

# Button
${arrowBack}                     xpath=//android.view.View[contains(@content-desc, "Localized")]/parent::android.view.View

# Field Search
${searchField}                   xpath=//android.widget.TextView[@text="Cari nama user"]/parent::android.widget.EditText
${searchList}                    xpath=//android.view.View[@content-desc="Image"]/parent::android.view.View

# Image Tidak ada Data
${dataNotFound}                  xpath=//android.view.View[2]/android.widget.ImageView

# Icon
${iconImg}                       xpath=//android.widget.ImageView
${iconDel}                       xpath=//android.view.View[contains(@content-desc, "Delete")]

*** Keywords ***
user go to User Management page
    User Login
    ${loc}    Loc Parent View    User Management
    Wait Until Element Is Visible    ${loc}
    Element Should Be Visible    ${loc}
    Click Element    ${loc}

# Without Login First
page User Management
    Wait Until Element Is Visible    accessibility_id=Icon Projects    timeout=10s
    ${loc}    Loc Parent View    User Management
    Wait Until Element Is Visible    ${loc}
    Click Element    ${loc}

user add user management
    home Project
    ${loc}    Loc Parent View    Tambah User
    Click Element    ${loc}
    Wait Until Element Is Visible    ${textUploadFile}

# Form User Management
user input Nama user management
    Generate Simple Random Name
    Generate Random Phone Number
    Generate Random Email
    Set Global Variable    ${nameUser}    ${randomStr}
    input text (EditText)    ${randomStr}     Masukkan nama user
    
user input text (EditText)
    [Arguments]    ${text}    ${locEditext}
    input text (EditText)    ${text}    ${locEditext}

user input wrong format email
    ${loc}    Loc Parent EditText    Masukkan email user
    Input Text    ${loc}    ${randomStr}
    
user input konfirmasi password
    [Arguments]    ${text}
    input password form user management    ${text}    Masukkan Konfirmasi password

# Alert Pop UP
user click button 
    [Arguments]    ${btn}
    ${loc}    Loc Parent View    ${btn}
    Click Element    ${loc}

click alert
    [Arguments]    ${btn_click}
    alert pop up show    ${iconImg}    ${alertTitle}    ${descTitle}    ${alertTitle}    ${btn_click}
    
show error message
    [Arguments]    ${errMsg}
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${errState}    timeout=3s
    IF    ${res}
        ${text}    Get Text    ${errState}
        Log To Console    Error Log: ${text}
        Should Be Equal    ${text}    ${errMsg}
    ELSE
        ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${hasRegistered}    timeout=3s
        IF    ${res}
            ${text}    Get Text    ${hasRegistered}
            Log To Console    Error Log: ${text}
            Should Be Equal    ${text}    ${errMsg}
        ELSE
            Log    N/A
            ${text}    Get Text    ${notPassVerif}
            Log To Console    Error Log: ${text}
        END
    END

verify password
    [Arguments]    ${errMsg}
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${passVerify}    timeout=3s
    IF    ${res}
        ${text}    Get Text    ${passVerify}
        Log To Console    Message Password: ${text}
    ELSE
        show error message    ${errMsg}
    END

search User Management
    [Arguments]    ${text}    ${result}
    Generate Simple Random Name
    user click element    ${searchField}
    Input Text    ${searchField}    ${text}

    # Press Keycode    66 (ENTER)
    Press Keycode    66
    Wait Until Element Is Visible    ${result}

# Get Text Nama pada List User Management
Get Detail Text User Management
    ${random}=    Evaluate    random.randint(1, 3)    modules=random
    Set Global Variable    ${indexUser}    ${random}
    Log    Random : ${random}
    # Sleep    4
    ${len}    Get Length    xpath=(//android.view.View[@content-desc="Image"])[${random}]/parent::android.view.View/android.widget.TextView
    FOR    ${counter}    IN RANGE    1    ${len}
        IF    '${counter}' == '1'
            get text detail on list user management    ${counter}    ${random}  
            Set Global Variable    ${nameUserManagement}    ${name}
            Log To Console  Nama User: ${nameUserManagement}

        ELSE IF    '${counter}' == '2'
            get text detail on list user management    ${counter}    ${random}
            Set Global Variable    ${jabatan}    ${name}
            Log To Console  Jabatan: ${jabatan}

        ELSE IF    '${counter}' == '3'
            get text detail on list user management    ${counter}    ${random}

        ELSE IF    '${counter}' == '4'
            get text detail on list user management    ${counter}    ${random}
            Set Global Variable    ${noTelp}    ${name}
            Log To Console  No Telp: ${noTelp}

            ${replaceNumb}=    Replace String    ${noTelp}    -    ${EMPTY}
            Set Global Variable    ${replaceNumb}    ${replaceNumb}
            
        ELSE IF    '${counter}' == '5'
            get text detail on list user management    ${counter}    ${random}

        ELSE IF    '${counter}' == '6'
            get text detail on list user management    ${counter}    ${random}
            Set Global Variable    ${email}    ${name}
            Log To Console  Email: ${email}

        ELSE IF    '${counter}' == '7'
            get text detail on list user management    ${counter}    ${random}

        ELSE IF    '${counter}' == '8'
            get text detail on list user management    ${counter}    ${random}
            Set Global Variable    ${projActive}    ${name}
            Log To Console  Project Aktif: ${projActive}
        ELSE
            BREAK
        END
    END

get text detail on list user management
    [Arguments]    ${counter}    ${random}
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=(//android.view.View[@content-desc="Image"])[${random}]/parent::android.view.View
    IF    ${res}
        ${name}    Get Text    xpath=(//android.view.View[@content-desc="Image"])[${random}]/parent::android.view.View/android.widget.TextView[${counter}]
        Set Global Variable    ${name}    ${name}
    ELSE
        Log    false
    END

Go to detail User Management
    Get Detail Text User Management
    user click element     xpath=(//android.view.View[@content-desc="Image"])[${indexUser}]/parent::android.view.View
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${textDetailUser}
    IF    ${res}
       FOR    ${counter}    IN RANGE    1    7
           IF    '${counter}' == '1'
               ${textName}    Get Text    ${pageDetailUser}/android.widget.TextView[${counter}]
               Should Be Equal    ${nameUserManagement}    ${textName}
            ELSE IF    '${counter}' == '2'
               ${textJabatan}    Get Text    ${pageDetailUser}/android.widget.TextView[${counter}]
               Should Be Equal    ${jabatan}    ${textJabatan}
            ELSE IF    '${counter}' == '4'
               ${textNoTelp}    Get Text    ${pageDetailUser}/android.widget.TextView[${counter}]
               Should Be Equal    ${noTelp}    ${textNoTelp}
            ELSE IF    '${counter}' == '6'
               ${textEmail}    Get Text    ${pageDetailUser}/android.widget.TextView[${counter}]
               Should Be Equal    ${email}    ${textEmail}
            ELSE
                Element Should Be Visible    ${pageDetailUser}
           END
       END
    ELSE
        Log    N/A
    END

## Delete User Management
Alert Delete User Management
    [Arguments]    ${btn_click}
    ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    ${iconDel}
    IF    ${res}
        user click element    ${iconDel}/parent::android.view.View
        alert pop up show    ${iconImg}    ${alertTitle}    ${descTitle}    ${alertTitle}    ${btn_click}
    ELSE
        Log    N/A
    END

Scroll elementss
    WHILE    ${True}
        ${res}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="${nameUser}"]    timeout=3s
        IF    ${res}
            user click element    xpath=//android.widget.TextView[@text="${nameUser}"]
            BREAK
        ELSE
            # Swipe down per card di list user management
            scroll down per card section
        END
    END