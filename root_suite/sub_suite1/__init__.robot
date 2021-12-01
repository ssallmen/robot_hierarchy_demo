*** Settings ***
Force Tags    sub_suite1
Suite Setup    Log Test Hierarchy Sub1 Variables
Suite Teardown    Log Test Hierarchy Sub1 Variables
Test Setup    Log To Console    You will never see this text as this will never execute

Resource    ../../resources/my_keywords.robot  # This is needed even if the same resource was loaded in the root suite init

*** Variables ***
${sub_suite1_var}    sub_suite1_value

*** Keywords ***
Log Test Hierarchy Sub1 Variables
    Log To Console    Running "Log Test Hierarchy Sub1 Variables" Suite setup
    My Own Keyword
    Log To Console    sub_suite1_var=${sub_suite1_var}
    # Log To Console    sub_suite2_var=${sub_suite2_var}  # This would cause error "Variable '${sub_suite2_var}' not found."
    # Log To Console    root_suite_var=${root_suite_var}  # This would cause error "Variable '${root_suite_var}' not found."
    Log To Console    global_var=${global_var}
    Log Variables
