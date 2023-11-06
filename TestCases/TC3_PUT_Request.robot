*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    String

*** Variables ***
${base_url}     https://reqres.in
${page_path}     $.page
${id_path}     $.id


*** Test Cases ***

Post Request Demo
     [Tags]     Demo
     create session  session1     ${base_url}     disable_warnings=1
     ${endpoint}     set variable    /api/users
     ${body}=    create dictionary    name=Rohit    job=SW Engineer
     ${response}=    Put On Session    session1    ${endpoint}    data=${body}
     log to console    ${response.status_code}
     log to console    ${response.content}

     #VALIDATIONS

     ${status_code}=    convert to string     ${response.status_code}
     should be equal    ${status_code}    201

     ${json_response}=    convert to string to json     ${response.content}
     ${contents}=    get value from json     ${json.response}     ${id_path}
     should not be empty    ${contents}


Put Request Demo
     [Tags]     Demo
     create session  session1     ${base_url}     disable_warnings=1
     ${endpoint}     set variable    /api/users/2
     ${body}=    create dictionary    name=Virat    job=Cricketer
     ${response}=    Put On Session    session1    ${endpoint}    data=${body}
     log to console    ${response.status_code}
     log to console    ${response.content}

     #VALIDATIONS

     ${status_code}=    convert to string     ${response.status_code}
     should be equal    ${status_code}    200

