*** Settings ***
Library    Collections
Library    String
Library    JSONLibrary
Library    RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com
${page_path}     $.page
${id_path}     $.id

*** Test Cases ***
Delete Request Demo
     [Tags]    Demo1
     create  session  session1     ${base_url}     disable_warnings=1
     ${endpoint}     set variable     posts/1
     ${response}=     Delete On Session    session1    ${endpoint}
     log to console    ${response.status_code}
     log to console    ${response.content}

     #VALIDATIONS
     ${status_code}=    convert to string     ${response.status_code}
     should be equal    ${status_code}    200





