*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
Test Case: Generate Random Phone Number
    # ${random_phone_number} =    Generate Random Phone Number
    # Log    Generated Random Phone Number: ${random_phone_number}

    # ${random_number}=    Evaluate    random.randint(1, 3)    modules=random
    # Log    Random number generated: ${random_number}
    # ${a}    Set Variable    6
    # FOR    ${counter}    IN RANGE   1    ${a}
    #     ${counter1}    Evaluate    ${counter} +1
    #     Log    ${counter1}
        
    # END
    amm

*** Keywords ***
Generate Random Phone Number
    ${random_number} =    Evaluate    '08' + str(random.randint(10000000, 99999999))  # Generate random number with prefix '08'
    Set Global Variable    ${aa}    ${random_number}
    RETURN    ${random_number}

amm
    ${ad}    Generate Random Phone Number
    Log To Console    ${ad}
    Log    ${aa}
    Log    ${ad}
