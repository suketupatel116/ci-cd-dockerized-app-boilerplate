install:
	# installing...
	pip install --upgrade pip && pip install -r requirements.txt
format:
	black *.py backend/*.py
	isort .
lint:
	# linging... flake8
	pylint --disable=R,C *.py backend/*.py
test:
	# testing...
deploy:
	# deploying...
all: install lint test deploy
