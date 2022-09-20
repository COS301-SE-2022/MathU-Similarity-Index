import pytest
from server import config

class TestConfigurations:

  def test_get_db_host(self):
    assert config.get_db_host()  == "localhost"

  def test_get_db_user(self):
    assert config.get_db_user() == "root"

  def test_get_db_password(self):
    assert config.get_db_password() == "my-secret-pw"

  def test_get_db_name(self):
    assert config.get_db_name() =="mathu_similarity_index_database"

  def test_get_db_port(self):
    assert config.get_db_port() == "3308"

