import json
import os


class JsonComparer_latest:
    def __init__(self):
        self.expected_file = None
        self.actual_file = None

    def set_filename(self, expected_file, actual_file):
        self.expected_file = expected_file
        self.actual_file = actual_file

    def load_json_from_file(self, file_path):
        with open(file_path, 'r') as json_file:
            return json.load(json_file)

    def compare_json_files(self, expected_json_file, actual_json_file):
        expected_data = self.load_json_from_file(expected_json_file)
        actual_data = self.load_json_from_file(actual_json_file)

        return expected_data == actual_data

    # To dump the rest api response_body into json file
    def dump_json(self, restapi_response, json_filename, expected_path):
        with open(os.path.join(expected_path, json_filename), 'w') as json_file:
            json.dump(restapi_response, json_file, indent=2)

    # To convert in REST API response output into valid JSON
    def convert_output_validate_to_json(self, output_validate_response):
        # Split the response into lines
        lines = output_validate_response.splitlines()

        # Find the line that starts with "{" and extract the JSON data
        json_data_start_line = next(line for line in lines if line.startswith("{"))
        json_data_end_line = next(line for line in lines[lines.index(json_data_start_line):] if line == "}")
        json_data = "\n".join(lines[lines.index(json_data_start_line):lines.index(json_data_end_line) + 1])

        # Parse the JSON data into a Python dictionary
        json_object = json.loads(json_data)

        return json_object

    # To check if REST API response is valid
    def is_valid_json(self, response_body):
        try:
            json_object = json.loads(response_body)
            return True
        except json.JSONDecodeError:
            return False


# Example to validate JsonComparer class
expected_json_file = 'expected.json'
actual_json_file = 'actual.json'

comparer = JsonComparer()
comparer.set_filename(expected_json_file, actual_json_file)

if comparer.compare_json_files(expected_json_file, actual_json_file):
    print("The JSON files are identical.")
else:
    print("The JSON files are not identical.")
