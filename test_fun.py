from backend.fun import fun

def test_fun():
    input = "World"
    response = fun(input)
    assert response == f"Hello {input}"