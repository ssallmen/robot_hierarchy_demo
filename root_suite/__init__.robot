*** Settings ***
Force Tags    root_suite
Suite Setup    Log Test Hierarchy Root Variables
Suite Teardown    Log Test Hierarchy Root Variables
Test Setup    Log To Console    You will never see this text as this will never execute

Resource    ../resources/my_keywords.robot

*** Variables ***
${root_suite_var}    root_suite_value

*** Keywords ***
Log Test Hierarchy Root Variables
    Log To Console    Running "Log Test Hierarchy Root Variables" Suite setup
    # Log To Console    sub_suite1_var=${sub_suite1_var}  # This would cause error "Variable '${sub_suite1_var}' not found."
    # Log To Console    sub_suite2_var=${sub_suite2_var}  # This would cause error "Variable '${sub_suite2_var}' not found."
    Log To Console    root_suite_var=${root_suite_var}
    My Own Keyword
    ${global_var}    Set Variable    global_value
    Set Global Variable    ${GLOBAL_VAR}
    Log Variables
