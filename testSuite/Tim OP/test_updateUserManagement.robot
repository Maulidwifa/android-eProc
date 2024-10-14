*** Settings ***
Documentation  Test Case User Management Flow
Library            AppiumLibrary
Resource           ../config/openApp.robot
Resource           ../../testScenario/Tim OP/userManagement.robot
Test Setup        Open app Dev Project
Test Teardown     Close App

*** Test Cases ***
Test User access detail User Management page
    [Documentation]            This scenario test User access User Management (Site/PIC) detail page and verify detail user
    [Tags]                     1000s    user management    test
    User Go To Detail User Management

Test User can Deleted User Management Project
    [Documentation]            This scenario test OP can delete User Management (Site/PIC) if project aktif 0
    [Tags]                     1000s    user management    test
    User Delete User Management

Test User Update User Management
    [Documentation]            This scenario test OP can update User Management (Site/PIC)
    [Tags]                     1000s    user management    test
    Ubah User Management

Test User Update User Management with invalid format email
    [Documentation]            This scenario test OP update User Management (Site/PIC) with format email invalid
    [Tags]                     1000s    user management    test
    user ubah User Management with format email invalid

Test User Update User Management with invalid format No Handphone
    [Documentation]            This scenario test OP update User Management (Site/PIC) with format email invalid
    [Tags]                     1000s    user management    test
    user ubah User Management with format No Handphone invalid

Test User Update User Management No Handphone has registered
    [Documentation]            This scenario test OP update User Management (Site/PIC) with no hanphone has been registered
    [Tags]                     1000s    user management    test
    user ubah User Management with No Handphone has been registered
