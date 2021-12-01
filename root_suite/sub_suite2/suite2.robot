*** Settings ***
Force Tags    test_suite_two
Suite Setup    Log Test Hierarchy Suite Variables
Suite Teardown    Log Test Hierarchy Suite Variables
Resource    ../../hierarchy_resources/my_keywords.robot  # This is needed even if the same resource was loaded in both the root suite and sub suite inits
Test Setup    Log To Console    This will execute for every test in this file

*** Variables ***
${test_suite_var}    test_suite_value

*** Test Cases ***
Test one of suite two
    [Tags]    test_one
    Log To Console    Running test "My Own Keyword"
    Log To Console    tags=${TEST_TAGS}
    Log To Console    global_var=${global_var}
    Log Variables

Test two of suite two
    [Tags]    test_two
    Log To Console    Running test "My Own Keyword"
    Log To Console    tags=${TEST_TAGS}
    Log To Console    global_var=${global_var}
    Log Variables

*** Keywords ***
Log Test Hierarchy Suite Variables
    Log To Console    Running "Log Test Hierarchy Sub Variables" Suite setup
    My Own Keyword
    Log To Console    test_suite_var=${test_suite_var}
    # Log To Console    sub_suite_var=${sub_suite_var}  # This would cause error "Variable '${sub_suite_var}' not found."
    # Log To Console    root_suite_var=${root_suite_var}  # This would cause error "Variable '${root_suite_var}' not found."
    Log To Console    global_var=${global_var}
    Log Variables
