import pytest
import requests
import json




def test_api_Status():

  url = "https://mathuserver.azurewebsites.net/graphql"

  payload="{\"query\":\"query APIStatus {\\n    APIStatus {\\n        success\\n        msg\\n        data\\n    }\\n}\",\"variables\":{}}"
  headers = {
    'Content-Type': 'application/json'
  }

  response = requests.request("POST", url, headers=headers, data=payload)
  assert response.status_code == 200
