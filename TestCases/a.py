import json
import robot

# Get the string output from Robot Framework
output = robot.result.output

# Convert the string output to JSON
json_output = json.loads(output)

# Save the JSON output to a file
with open('output.json', 'w') as f:
    json.dump(json_output, f)