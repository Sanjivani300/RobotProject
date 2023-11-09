*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://restful-booker.herokuapp.com
${city}     7

*** Test Cases ***
Get_restfullBookInfo
     create session    myssion     ${base_url}
     ${response}=    get request    myssion    /booking/${city}
     #log to console    ${response.status_code}
     #log to console    ${response.content}
     #log to console    ${response.headers}

     #VALIDATIONS
     ${status_code}=    convert to string     ${response.status_code}
     should be equal    ${status_code}    200

     ${body}=    convert to string     ${response.content}
     should contain    ${body}    Jim

     ${contentTypeValue}=    get from dictionary    ${response.headers}    Content-Type
     should be equal ${contentTypeValue}    application/json; charset=utf-8

     #value_Is_Change_ie_"Jim"_in_API_So_Error

