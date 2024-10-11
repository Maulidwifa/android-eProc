*** Settings ***
Documentation  Test Case User Management Flow
Library            AppiumLibrary
Resource           ../config/openApp.robot
Resource           ../../testScenario/Tim OP/userManagement.robot
Test Setup        Open app Dev Project
Test Teardown     Close App

*** Test Cases ***
# Test Create User Management
#     [Documentation]            This scenario test User Create User Management (Site/PIC)
#     [Tags]                     1000s    user management    test
#     User create User Management

# Test Create User Management with format Email invalid
#     [Documentation]            This scenario test User Create User Management (Site/PIC) with invalid format email
#     [Tags]                     1000s    user management    test
#     User create User Management without format email valid

# Test Create User Management with format No Telp invalid
#     [Documentation]            This scenario test User Create User Management (Site/PIC) with invalid format No Telp
#     [Tags]                     1000s    user management    test
#     User create User Management without format No Handphone valid

# Test Create User Management with No Handphone has registered
#     [Documentation]               This scenario test User Create User Management (Site/PIC) with No Telp has been resgistered
#     [Tags]                        1000s    user Management    test
#     User create User Management with No Telp has been registered
    
# Test Create User Management with confirm password not match
#     [Documentation]            This scenario test User Create User Management (Site/PIC) with confirm password
#     [Tags]                     1000s    user management    test
#     User create User Management confirm password not match

# Test Create User Management with confirm password less than 8 character
#     [Documentation]            This scenario test User Create User Management (Site/PIC) with password less than 8 char
#     [Tags]                     1000s    user management    test
#     User create User Management password less than 8 char

# Test Create User Management with confirm password must be char & number
#     [Documentation]            This scenario test User Create User Management (Site/PIC) with password combine char & number
#     [Tags]                     1000s    user management    test
#     User create User Management password must be combine char & number

# Test Cancel create User Management
#     [Documentation]            This scenario test User cancel Create User Management (Site/PIC)
#     [Tags]                     1000s    user management    test
#     Click Ya alert Batal Tambah User

# Test Click Tidak on alert Batal Tambah User
#     [Documentation]            This scenario test User click Tidak alert Batal tambah user
#     [Tags]                     1000s    user management    test
#     Click Tidak alert Batal Tambah User

# Test Search User Management not found
#     [Documentation]            This scenario test User search User Management (Site/PIC) not found
#     [Tags]                     1000s    user management    test
#     User search Data Tidak ditemukan User Management

# Test Search Name User Management
#     [Documentation]            This scenario test User search User Management (Site/PIC)
#     [Tags]                     1000s    user management    test
#     User search user management by Name

# Test User access detail User Management page
#     [Documentation]            This scenario test User access User Management (Site/PIC) detail page and verify detail user
#     [Tags]                     1000s    user management    test
#     User Go To Detail User Management

# Test User can Deleted User Management Project
#     [Documentation]            This scenario test OP can delete User Management (Site/PIC) if project aktif 0
#     [Tags]                     1000s    user management    test
#     User Delete User Management

Test User Update User Management
    [Documentation]            This scenario test OP can update User Management (Site/PIC)
    [Tags]                     1000s    user management    test
    Ubah User Management
    