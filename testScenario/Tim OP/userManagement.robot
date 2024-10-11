*** Settings ***
Resource        ../../pom/Tim OP/userManagementPage.robot
Resource        ../config/openApp.robot
Resource        ../pom/generalFunction.robot
Resource        ../../pom/Tim OP/detailUserManagementPage.robot


*** Keywords ***
User create User Management
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    And user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
    And user input text (EditText)    ${passwordSite}    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And verify password    Password sesuai
    And user click button (parent view)    Tambah
    And click alert    Ya

# User create User Management with Name has been used
#     Given user go to User Management page
#     And Get Detail Text User Management
#     And user add user management
#     And user input Nama user management
#     Then user input text (EditText)    ${randomStr}    Masukan jabatan user
#     And user input text (EditText)    ${randomEmail}    Masukkan email user
#     And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
#     And user input text (EditText)    ${passwordSite}    Masukkan password
#     And user input konfirmasi password    ${passwordSite}
#     And user click button (parent view)    Tambah

User create User Management without format email valid
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    And user input Nama user management
    Then user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomStr}    Masukkan email user
    And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
    And user input text (EditText)    ${passwordSite}    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And show error message    Email harus memiliki @ dan domain.
    And user click button (parent view)    Tambah

User create User Management without format No Handphone valid
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    And user input Nama user management
    Then user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    12345    08xxxxxxxxxx
    And user input text (EditText)    ${passwordSite}    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And show error message    No. handphone harus diawali dengan 08

User create User Management with No Telp has been registered
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    And user input Nama user management
    And user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    ${replaceNumb}    08xxxxxxxxxx
    And user input text (EditText)    ${passwordSite}    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And user click button (parent view)    Tambah
    And click alert    Ya
    And show error message    No. handphone sudah terdaftar
    
User create User Management confirm password not match
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    And user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
    And user input text (EditText)    ${passwordSite}    Masukkan password
    And user input konfirmasi password    abcd123
    And verify password    Konfirmasi password tidak sesuai

User create User Management password less than 8 char
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    Then user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
    And user input text (EditText)    acdfff    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And verify password    password harus memiliki minimal 8 karakter

User create User Management password must be combine char & number
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    And user input text (EditText)    ${randomStr}    Masukan jabatan user
    And user input text (EditText)    ${randomEmail}    Masukkan email user
    And user input text (EditText)    ${randNumber}    08xxxxxxxxxx
    And user input text (EditText)    acdfffwww    Masukkan password
    And user input konfirmasi password    ${passwordSite}
    And verify password    Password harus terdiri dari kombinasi huruf dan angka

Click Ya alert Batal Tambah User
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    And user click element    ${arrowBack} 
    And click alert    Ya

User search Data Tidak ditemukan User Management
    Given user go to User Management page
    When search User Management    ${randomStr}    ${dataNotFound}
    Then Element Should Be Visible    ${dataNotFound}

User search user management by Name
    Given user go to User Management page
    And Get Detail Text User Management
    When search User Management    ${nameUserManagement}    ${searchList}
    And Element Should Be Visible    ${searchList}

Click Tidak alert Batal Tambah User
    Given user go to User Management page
    And Get Detail Text User Management
    When user add user management
    Then user input Nama user management
    And user click element    ${arrowBack} 
    And click alert    Tidak
    
# Detail User Management
User Go To Detail User Management
    Given user go to User Management page
    When Go to detail User Management
    
User Delete User Management
    Given User create User Management
    And page User Management
    And Scroll elementss
    Then Alert Delete User Management    Ya

Ubah User Management
    Given User Go To Detail User Management
    Then click icon ubah user management
    And edit Field    ${randomStr}    Masukkan nama user    ${nameUserManagement}
    And edit Field    ${randomStr}    Masukan jabatan user    ${jabatan}
    And edit Field    ${randomEmail}    Masukkan email user    ${email}
    And edit Field    ${randNumber}    08xxxxxxxxxx    ${replaceNumb}
    And user click button (parent view)    Simpan
    # And click alert    Ya

user ubah User Management with format email invalid
    Given User Go To Detail User Management
    Then click icon ubah user management
    And edit Field    ${randomStr}    Masukkan email user    ${email}
    And show error message    Email harus memiliki @ dan domain.
    
user ubah User Management with format No Handphone invalid
    Given User Go To Detail User Management
    Then click icon ubah user management
    And edit Field    12345    08xxxxxxxxxx    ${replaceNumb}
    And show error message    No. handphone harus diawali dengan 08

user ubah User Management with No Handphone has been registered
    Given User Go To Detail User Management
    Then click icon ubah user management
    And edit Field    08123456789    08xxxxxxxxxx    ${replaceNumb}
    And user click button (parent view)    Simpan
    And click alert    Ya
    And show error message    No. handphone sudah terdaftar