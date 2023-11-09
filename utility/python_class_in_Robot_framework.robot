'''Import the Python module in Robot Framework script '''
*** Settings ***
Library  ../utility/json_comparer_module.py


''' *** Create an instance of the JsonComparer class:*** '''
*** Variables ***
${expected_json_file}    path/to/expected.json
${actual_json_file}      path/to/actual.json

*** Test Cases ***
Example Test
    ${comparer}=  Create Instance  JsonComparer


''' *** Test Cases - Set filenames for comparison: *** '''
Example Test
    ${comparer}=  Create Instance  JsonComparer
    Set Filename  ${comparer}  ${expected_json_file}  ${actual_json_file}

''' *** Test Cases -Load JSON files and compare: ***  '''
Example Test
    ${comparer}=  Create Instance  JsonComparer
    Set Filename  ${comparer}  ${expected_json_file}  ${actual_json_file}
    ${result}=    Compare JSON Files  ${comparer}
    Should Be True  ${result}   # Add appropriate verification based on your test case


''' *** Test Cases - Dump REST API response to JSON file: *** '''
Example Test
    ${comparer}=  Create Instance  JsonComparer
    Set Filename  ${comparer}  ${expected_json_file}  ${actual_json_file}
    ${api_response}=  # Get the REST API response (implement this based on your test case)
    Dump JSON  ${comparer}  ${api_response}  output.json


''' *** Test Cases - Convert output validation response to JSON ***  '''
Example Test
    ${comparer}=  Create Instance  JsonComparer
    Set Filename  ${comparer}  ${expected_json_file}  ${actual_json_file}
    ${output_response}=  # Get the output validation response (implement this based on your test case)
    ${json_object}=  Convert Output Validate to JSON  ${comparer}  ${output_response}

''' *** Test Cases -Check if REST API response is valid JSON: ***  '''
Example Test
    ${comparer}=  Create Instance  JsonComparer
    Set Filename  ${comparer}  ${expected_json_file}  ${actual_json_file}
    ${api_response}=  # Get the REST API response (implement this based on your test case)
    ${is_valid}=  Is Valid JSON  ${comparer}  ${api_response}
    Should Be True  ${is_valid}   # Add appropriate verification based on your test case