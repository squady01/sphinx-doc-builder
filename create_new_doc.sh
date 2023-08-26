#!/bin/sh

# Argument check
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <DOC_NAME>"
    echo "Example: $0 Test"
    exit 1
fi

# Check for docker-compose installation
command -v docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is not installed. Aborting."; exit 1; }

DOC_PATH=./docs/$1

echo "Initializing documentation at path: $DOC_PATH"

# Running Docker Compose from the docker subdirectory to initialize the Sphinx project
(docker-compose run --rm -w /app/$DOC_PATH -v $(pwd)/docs/sphinx:/app sphinx_builder sphinx-quickstart)

# Check for the success of the previous command
if [ $? -ne 0 ]; then
    echo "Error initializing the documentation."
    exit 1
fi

echo "Documentation successfully initialized at path: $DOC_PATH"
