install:
	# installing...
	pip install --upgrade pip && pip install -r requirements.txt
format:
	black *.py backend/*.py
	isort .
lint:
	# linting... flake8
	pylint --disable=R,C *.py backend/*.py
test:
	# testing...
	python -m pytest -vv --cov=backend test_*.py
build:
	# building container...
	docker build -t deploy-img .
run:
	# running docker
	docker run -p 127.0.0.1:8080:8080 e7fe4a6c343c
deploy:
	# deploying...
all: install lint test deploy
