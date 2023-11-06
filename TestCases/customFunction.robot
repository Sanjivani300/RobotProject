*** Settings ***
Library    Selenium2Library
Library    custom_lib.Class2

*** Test Cases ***
google test
     open browser    https://www.google.com    chrome
     maximize browser window
     ${SEARCH} =    Get Google Search Param
     input text    id=1st-ib    ${SEARCH}
     sleep    5
     close browser