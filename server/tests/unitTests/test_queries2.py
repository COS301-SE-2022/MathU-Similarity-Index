import pytest

from server.api.queries2 import *

from server.config import get_db_host, get_db_name, get_db_password, get_db_port, get_db_user
from server.db.connect_db import MySQLDatabase
from datetime import datetime


class TestQueries:

  def test_resolve_api_status(self):
    assert resolve_api_status("","") == f'API is running'

  def test_resolve_get_allequations(self):
    assert resolve_get_all_equations("","") == []

  # def test_resolve_search(self):
  #     assert queries2.resolve_search("","","","","","") ==


  def test_resolve_authentcate_login(self):
    assert resolve_authenticate_login("","","","") == {
        "success": True,
        "msg": "Login Success",
        "user": {
            "useremail": "test@email.com",
            "username": "none",
            "apikey": "testkey",
            "isadmin": False,
            "darktheme": False
        }
    }

  def test_resolve_get_server_settings(self):
    assert resolve_get_server_settings("","","","") == {
        "autocaching": True
    }


