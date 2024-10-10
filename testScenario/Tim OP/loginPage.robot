*** Settings ***
Resource        ../../pom/loginPage.robot
Resource        ../config/openApp.robot

*** Keywords ***
# Success Login
User Login
    Given user input no handphone    ${akunOP}
    When user input password    ${passwordProject}
    Then click button masuk
    And home Project

User login invalid No Handphone
    Given user input no handphone    21313
    When user input password    ${passwordProject}
    Then click button masuk
    And error message

User login without input No Handphone and Password
    Given user input no handphone    ${EMPTY}
    When user input password    ${EMPTY}
    Then click button masuk
    And error message

User login with No Handphone not listed
    Given user input no handphone    0809017831673
    When user input password    ${passwordProject}
    Then click button masuk
    And error message

User login without input No Handphone
    Given user input no handphone    ${EMPTY}
    When user input password    ${passwordProject}
    Then click button masuk
    And error message

User login without input Password
    Given user input no handphone    ${akunOP}
    When user input password    ${EMPTY}
    Then click button masuk
    And error message