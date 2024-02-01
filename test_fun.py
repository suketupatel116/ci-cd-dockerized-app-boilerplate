"""Tests"""

from backend.fun import fun


def test_fun():
    """Test Assert Output"""
    arg = "World"
    response = fun(arg)
    assert response == f"Hello {arg}"
