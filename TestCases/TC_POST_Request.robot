*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=     https://restful-booker.herokuapp.com

*** Test Cases ***
Put_CustomerRegistration
     create session    myssion     ${base_url}
     ${body}=    create dictionary    firstname=Jim    lastname=Brown    totalprice=111    depositpaid=true    bookingdates=    checkin=2018-01-01    checkout=2019-01-01    additionalneeds=Breakfast
     ${header}=    create dictionary    Content-Type=application/json; charset=utf-8
     ${response}=    post request    myssion    /booking    data=${body}    headers=${header}

     log to console    ${response.status_code}
     log to console    ${response.content}

     #VALIDATIONS

     ${status_code}=    convert to string     ${response.status_code}
     should be equal    ${status_code}    200

     ${res_body}=    convert to string     ${response.content}
     should be equal    ${res_body}    4863

     #value_Is_Change_ie_"200"_and_"4863"_in_API_So_Error