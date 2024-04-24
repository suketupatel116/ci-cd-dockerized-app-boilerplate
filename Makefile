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
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 250088911685.dkr.ecr.us-east-1.amazonaws.com
	docker build -t ci-cd-boilerplate-app .
	docker tag ci-cd-boilerplate-app:latest 250088911685.dkr.ecr.us-east-1.amazonaws.com/ci-cd-boilerplate-app:latest
	docker push 250088911685.dkr.ecr.us-east-1.amazonaws.com/ci-cd-boilerplate-app:latest
all: install lint test deploy
