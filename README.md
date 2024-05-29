# Django Boilerplate

This is a Django boilerplate project with a setup for a RESTful API using DRF and PostgreSQL. It includes several essential packages and configurations for rapid development and deployment.

## Dependencies

This project uses `poetry` for dependency management. The following dependencies are included:

### Main Dependencies

- **Python**: ^3.11
- **Django**: ^5.0.2
- **Django REST framework**: ^3.14.0
- **python-dotenv**: ^1.0.1
- **psycopg**: ^3.1.18
- **gunicorn**: ^21.2.0
- **django-cors-headers**: ^4.3.1
- **drf-spectacular**: ^0.27.2

### Development Dependencies

- **pre-commit**: ^3.6.2
- **black**: ^24.2.0
- **isort**: ^5.13.2
- **flake8**: ^7.0.0
- **pre-commit-hooks**: ^4.5.0
- **pytest**: ^8.1.1
- **ipython**: ^8.24.0

## Getting Started

### Prerequisites

- Python 3.11
- Poetry

### Installation

1. **Clone the repository**:

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Install dependencies**:

    ```sh
    poetry install
    ```

3. **Set up environment variables**:

    Create a `<ENV>.env` file in the project root and add the necessary environment variables. Replace `<ENV>` with the name of your environment (e.g., `development`, `production`). For example, for a development environment:

    ```sh
    touch development.env
    ```

    Add the following to `development.env`:

    ```env
    DEBUG=True
    SECRET_KEY=your_secret_key
    API_TITLE=API
    API_VERSION=1.0.0
    API_DESCRIPTION=API Documentation
    SWAGGER_ENABLED=True
    SWAGGER_URL="api/docs/"
    SWAGGER_SCHEMA_URL="api/schema/"
    SWAGGER_INCLUDE_SCHEMA=False
    POSTGRES_DB=database_name
    POSTGRES_USER=database_user
    POSTGRES_PASSWORD=database_password
    POSTGRES_HOST=database_host
    POSTGRES_PORT=database_port
    ALLOWED_HOSTS=127.0.0.1,localhost
    CORS_ALLOWED_ORIGINS=127.0.0.1,localhost
    ```

    Ensure you set the `ENV` environment variable to the name of your environment:

    ```sh
    export ENV=development
    ```

### Running the Project

1. **Apply migrations**:

    ```sh
    poetry run python manage.py migrate
    ```

2. **Run the development server**:

    ```sh
    poetry run python manage.py runserver
    ```

### Running Tests

Run tests using `pytest`:

```sh
poetry run pytest
```

## Code Quality

This project uses several tools to ensure code quality. These tools are configured to run with `pre-commit`.

1. **Install pre-commit hooks**:

    ```sh
    poetry run pre-commit install
    ```

2. **Run pre-commit hooks manually**:

    ```sh
    poetry run pre-commit run --all-files
    ```

### Formatting and Linting

- **black**: For code formatting.
- **isort**: For import sorting.
- **flake8**: For linting.

You can run these tools manually:

```sh
poetry run black .
poetry run isort .
poetry run flake8
```
## Documentation

This project uses `drf-spectacular` to generate API documentation.
The following environment variables affect the documentation setup. These should be defined in the `<ENV>.env` file:

- **API_TITLE**: Title of your API.
- **API_VERSION**: Version of your API.
- **API_DESCRIPTION**: Description of your API.
- **SWAGGER_ENABLED**: Enable/disable Swagger UI and ReDoc.
- **SWAGGER_URL**: URL path for Swagger UI. (e.g api/docs/)
- **SWAGGER_SCHEMA_URL**: URL path for ReDoc schema. (e.g api/schema/)
- **SWAGGER_INCLUDE_SCHEMA**: Include schema in Swagger UI.

**Note**: Changes to these settings should be made in the `.env` file.

- Access the Swagger UI at: `/${SWAGGER_URL}`
- Access the ReDoc at: `/${SWAGGER_SCHEMA_URL}`


## Deployment

This project uses `gunicorn` as the WSGI HTTP server.

To deploy the application, you can run:

```sh
poetry run gunicorn config.wsgi:application
```


## Makefile

For convenience, this project includes a `Makefile` with common development tasks:

```makefile
PROJECT_NAME = $(shell pwd | rev | cut -f1 -d'/' - | rev)

lint:
	poetry run pre-commit install && poetry run pre-commit run -a -v

test:
	poetry run pytest -s -x -vv

# DJANGO
migrate:
	poetry run python manage.py migrate

migrations:
	poetry run python manage.py makemigrations

format:
	poetry run isort .
	poetry run black .
```

### Usage:

1. Ensure you have `make` installed (`sudo apt install make` on Debian-based systems).
2. Place this `Makefile` in your project's root directory.
3. You can then use commands like `make lint`, `make test`, `make migrate`, `make migrations`, and `make format` to execute these tasks.

This `Makefile` provides a convenient way to manage common development tasks in your Django project. Adjust the commands as needed based on your project's structure and requirements.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

Feel free to customize this `README.md` according to your project's specifics.
