install:
	# installing...
	pip install --upgrade pip && pip install -r requirements.txt
format:
	black *.py backend/*.py
	isort .
lint:
	# linting... flake8
	pylint *.py backend/*.py
test:
	# testing...
	python -m pytest -vv --cov=backend test_*.py
build:
	# building container...
deploy:
	# deploying...
all: install lint test deploy
