import time

class CustomLib:
    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    def get_current_time_as_string(self):
        localtime = time.localtime()
        formatted_time = time.strftime("%Y%m%d%H%M%S",localtime)
        return formatted_time

class Class2:
    ROBOT_LIBRARY_SCOPE = 'TEST CASE'

    def get_google_search_param(self):
        search_param = "this is google test search"
        return search_param

