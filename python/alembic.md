# Alembic: DB migration tool with SQLAlchemy

## Installation


```
# Poetry command
poetry add alembic
# Or PIP dependency managment
pip install alembic

alembic init alembic
```

Alembic also includes other environment templates. These can be listed out using the list_templates command:

```sh
alembic list_templates
  Available templates:

  generic - Generic single-database configuration.
  async - Generic single-database configuration with an async dbapi.
  multidb - Rudimentary multi-database configuration.

  Templates are used via the 'init' command, e.g.:

    alembic init --template generic ./scripts
```

## Editing the .env File

define a new function in ./alembic/env.py called _get_url_
```python
def get_url():
    user = os.getenv("POSTGRES_USER", "postgres")
    password = os.getenv("POSTGRES_PASSWORD", "")
    host = os.getenv("POSTGRES_HOST", "db")
    port = os.getenv("POSTGRES_PORT", '5432')
    db = os.getenv("POSTGRES_DB", "app")
    # print(f"postgresql://{user}:{password}@{host}:{port}/{db}")
    return f"postgresql://{user}:{password}@{host}:{port}/{db}"
```

change in _run_migrations_offline()_

```python
# url = config.get_main_option("sqlalchemy.url")
    url = get_url
```

change in _run_migrations_online()_
```python
configuration = config.get_section(config.config_ini_section)
    configuration["sqlalchemy.url"] = get_url()
    connectable = engine_from_config(
        # config.get_section(config.config_ini_section, {}),
        configuration,
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )
```

## Auto Generating migration script

environment variables have to be load before generate a migration

To use autogenerate, we first need to modify our env.py [alembic/] so that it gets access to a table metadata object that contains the target. Suppose our application has a declarative base in app.db.base 


```python
# add your model's MetaData object here
from app.models import Model1, Model2, ....
# for 'autogenerate' support
# from myapp import mymodel
# target_metadata = mymodel.Base.metadata
target_metadata = None
```

```python
from app.db.base  import Base
target_metadata = Base.metadata
```


With the environment in place we can create a new revision, using alembic revision:

```sh
alembic revision --autogenerate -m "some useful message"
```

- Running our First Migration
```
# Migrate to the most recent
alembic upgrade head

# Migrate given target revision
alembic upgrade revisionTarget
```

Any time we need to refer to a revision number explicitly, we have the option to use a partial number. As long as this number uniquely identifies the version, it may be used in any command in any place that version numbers are accepted:

```
alembic upgrade ae1
```
Above, we use ae1 to refer to revision ae1027a6acf. Alembic will stop and let you know if more than one version starts with that prefix.

## Relative Migration
Relative upgrades/downgrades are also supported. To move two versions from the current, a decimal value “+N” can be supplied:
```
alembic upgrade +2
```

Negative values are accepted for downgrades:
```
alembic downgrade -1
```

## some usefultips

- if when trying add a dependency give  a error: pg_config executable not found

  ```sh
  python --version
  sudo apt install libpq-dev python3.10-dev
  ```
