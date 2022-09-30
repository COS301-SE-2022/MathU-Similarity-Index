import requests
import json

import pytest


def test_similarity_search():

  url = "https://mathuserver.azurewebsites.net/graphql"

  payload="{\"query\":\"query SimilaritySearch ($useremail: String, $apikey: String, $input: String, $tags: [Int], $musthavememo: Boolean, $allowusersearch: Boolean) {\\n    SimilaritySearch (useremail: $useremail, apikey: $apikey, input: $input, tags: $tags, musthavememo: $musthavememo, allowusersearch: $allowusersearch) {\\n        success\\n        msg\\n        numberofresults\\n        equations {\\n            equation {\\n                id\\n                latex\\n                tags {\\n                    id\\n                    name\\n                    description\\n                }\\n                mathml\\n                memolinks\\n                favorite\\n                issearch\\n            }\\n            similarity\\n            distance\\n        }\\n    }\\n}\",\"variables\":{\"useremail\":\"\",\"apikey\":\"\",\"input\":\"\",\"tags\":[0],\"musthavememo\":true,\"allowusersearch\":true}}"
  headers = {
    'Content-Type': 'application/json'
  }

  response = requests.request("POST", url, headers=headers, data=payload)

  assert response.status_code == 200
