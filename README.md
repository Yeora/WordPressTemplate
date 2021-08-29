## WordPressTemplate
This is a simple template to set up a local development environment for WordPress development.
For the implementation we use the containerization by using Docker.

## Prerequisites
- Linux
- Docker Engine & Docker Compose (https://docs.docker.com/)
- Make

## Installation
Ensure Docker is running before using these commands.
1. Git clone or download repository
2. Open terminal
3. Navigate into repository (```cd path/to/repository```)
4. ```make build``` to build the image
5. ```make up``` to start the development containers
6. Navigate to http://localhost:80 in your browser
