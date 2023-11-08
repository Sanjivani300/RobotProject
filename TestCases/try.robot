*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    www.google.com

*** Keywords ***
open browser    ${url}    chrome