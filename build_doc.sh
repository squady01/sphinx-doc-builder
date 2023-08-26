# Check for the existence of docker-compose
command -v docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is not installed. Aborting."; exit 1; }

# Ensure the correct number of arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <Project> <format>"
    echo "Example: $0 ./docs/Test html"
    exit 1
fi

# Determine the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo $DIR 
# Check for the existence of docker-compose.yml
if [ ! -f "$DIR/docker-compose.yml" ]; then
    echo "Error: docker-compose.yml file not found in $DIR"
    exit 1
fi

# Check for the existence of the sphinx_builder service in docker-compose.yml
if ! grep -q "sphinx_builder:" "$DIR/docker-compose.yml"; then
    echo "Error: The sphinx_builder service is not defined in docker-compose.yml"
    exit 1
fi

# Execute Docker Compose
docker-compose run --rm -w /app/$1 -v $DIR:/app sphinx_builder make ${@:2}

# Check the success of the previous command
if [ $? -ne 0 ]; then
    echo "Error during documentation build."
    exit 1
fi

echo "Documentation successfully built!"
