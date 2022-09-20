import pytest

from pickle import TRUE
from server.api.mutation import resolve_add_equation
from server.api.mutation import *

class TestMutations:

  payload = {
        "success": True,
        "msg": "",
        "equation": {
            "id": 0,
            "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
            "latex": "1+2",
            "type": "Equation",
            "category": "Addition"
        }
  }

  def test_add_equation(self):
    payload = {
        "success": True,
        "msg": "",
        "equation": {
            "id": 0,
            "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
            "latex": "1+2",
            "type": "Equation",
            "category": "Addition"
        }
  }
    assert resolve_add_equation("","","","","") == payload


  def test_add_favorite(self):
    assert resolve_add_favorite("","","","","") == True

  def test_user_search_click(self):
    assert resolve_add_user_search_click("","","","","") == True

  def test_user_sign_up(self):
    assert resolve_user_sign_up("","","","") == True

  def test_auto_caching(self):
    assert resolve_set_auto_caching("","","","") == True

  def test_set_theme(self):
    assert resolve_set_theme("","","","","") == True
