
# Sphinx-Doc-Builder

Sphinx-Doc-Builder streamlines the process of creating and building Sphinx documentation within a Docker environment. This project provides a Dockerfile that generates an image encompassing Sphinx-Doc and all its associated dependencies. The utility scripts facilitate both the initialization of base documentation and its subsequent building in the desired format.

---

## Prerequisites

- Ensure `docker` and `docker-compose` are installed on your system.

---

## Getting Started

### 1. Build the Docker image:

Navigate to the `docker` directory and execute the following:

```
./build_image.sh
```

This script will use the provided `dockerfile` to create a Docker image named `sphinx-doc-builder`.

### 2. Initialize New Documentation:

From the project root directory, execute the `create_new_doc.sh` script, specifying the desired name for your documentation.

```
./create_new_doc.sh <DOC_NAME>
```

For example, to create documentation named "Test":

```
./create_new_doc.sh Test
```

### 3. Build the Documentation:

With your documentation initialized, you can build it using the `build_doc.sh` script. Provide the path to your documentation and your desired output format as arguments:

```
./build_doc.sh <PATH_TO_DOC> <FORMAT>
```

For instance, to build documentation located at `./docs/Test` in HTML format:

```
./build_doc.sh ./docs/Test html
```

---
