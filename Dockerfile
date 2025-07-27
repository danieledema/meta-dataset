FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv sync --locked

ENV RECORDS_DIR=/data/records
ENV SPLIT_DIR=/data/splits

# Presuming there is a `my_app` command provided by the project
ENTRYPOINT ["sh", "dataset_conversion.sh"]
