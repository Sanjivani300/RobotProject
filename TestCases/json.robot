
                                      # How to get the value from json file

*** Settings ***
Documentation    Read Data From JSON file using Robot Framework
...     Library Documenation : https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html
Library    JSONLibrary



*** Test Cases ***
Get Data Name From Json File
     ${file}     load json from file    ${CURDIR}${/}jsonFile.json

     # Get Data Name
     ${json_name}     get value from json    ${file}     $.Name
     log to console    Value name is ${json_name[0]}

     # Get Test
     ${json_test}     get value from json    ${file}     $.Test
     log to console    Value test is ${json_test[0]}

     # Get Cities
     ${json_city}     get value from json    ${file}     $.City
     log to console    Value cities is ${json_city[0]}

     # To Get each of the cities
     ${json_city}     get value from json    ${file}     $.City[0]
     log to console    Value cities is ${json_city[0]}
     should be equal as strings    ${json_city[0]}    City1

     # Numbers
     ${json_number}     get value from json    ${file}     $.Number
     log to console    get all Numbers ${json_number[0]}

     # To Get Mobile Number Only
     ${json_mobile}     get value from json    ${file}     $.Number.Mobile
     log to console    Mobile only ${json_mobile[0]}
     should be equal    ${json_mobile[0]}    5748574565

     # To Get Telephone Number Only
     ${json_tel}     get value from json    ${file}     $.Number.Telephone
     log to console    Telephone only ${json_tel[0]}
     should be equal    ${json_tel[0]}    2836576768




