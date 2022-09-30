import pytest

import requests
import json





def test_Get_Equations():

    url = "https://mathuserver.azurewebsites.net/graphql"

    payload="{\"query\":\"query GetAllEquations ($useremail: String, $apikey: String) {\\n    GetAllEquations (useremail: $useremail, apikey: $apikey) {\\n        success\\n        msg\\n        equations {\\n            id\\n            latex\\n            tags {\\n                id\\n                name\\n                description\\n            }\\n            mathml\\n            memolinks\\n            favorite\\n            issearch\\n        }\\n    }\\n}\",\"variables\":{\"useremail\":\"\",\"apikey\":\"\"}}"
    headers = {
      'Content-Type': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    assert response.status_code == 200




