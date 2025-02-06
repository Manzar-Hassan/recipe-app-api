FROM python:3.9-alpine3.13
LABEL maintainer="manzar_hassan@example.com"

ENV PYTHONUNBUFFERED=1

# Set ARG before usage
ARG DEV=false

# Copy and install dependencies in one step to leverage layer caching
COPY ./requirements.txt ./requirements.dev.txt /tmp/
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then /py/bin/pip install -r /tmp/requirements.dev.txt; fi && \
    rm -rf /tmp

# Set work directory and copy application code
WORKDIR /app
COPY ./app /app

# Expose port
EXPOSE 8000

# Create non-root user and set permissions
RUN adduser --disabled-password --no-create-home django-user
ENV PATH="/py/bin:$PATH"

# Switch to non-root user
USER django-user
