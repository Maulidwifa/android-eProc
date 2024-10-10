*** Settings ***
Documentation  Simple example using AppiumLibrary
Library            AppiumLibrary
Resource           ../config/openApp.robot
Resource           ../../testScenario/Tim OP/loginPage.robot
Test Setup        Open app Dev Project
Test Teardown     Close App

*** Test Cases ***
Test Login Success
    [Documentation]            This scenario test User login app E-Proc1000s
    [Tags]                     1000s    home    test
    User Login
    
Test Login invalid no handphone
    [Documentation]            This scenario test User invalid input no handphone
    [Tags]                     1000s    home    test
    User login invalid No Handphone

Test Login without input No Handphone and Password
    [Documentation]            This scenario test User without input no handphone and password
    [Tags]                     1000s    home    test
    User login without input No Handphone and Password

Test Login With no handphone not listed
    [Documentation]            This scenario test User input no handphone has not been registered
    [Tags]                     1000s    home    test
    User login with No Handphone not listed
    
Test Login with no input No Handphone
    [Documentation]            This scenario test User without input no handphone
    [Tags]                     1000s    home    test
    User login without input No Handphone
    

Test Login with no input password
    [Documentation]            This scenario test User without input password
    [Tags]                     1000s    home    test
    User login without input Password
    