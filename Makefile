PROJECT_NAME = $(shell pwd | rev | cut -f1 -d'/' - | rev)

lint:
	poetry run pre-commit install && poetry run pre-commit run -a -v

test:
	poetry run pytest -s -x -vv

# DJANGO
migrate:
	./manage.py migrate

migrations:
	./manage.py makemigrations

format:
	isort .
	black .
