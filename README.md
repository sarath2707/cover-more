
About Docker Compose Yaml
     1. If we run "docker-compose.yml" then all the microservices will be installed seperately in the local setup
     2. To run the environment specific configuration, use the "docker-compose-dev.yml" for development, "docker-compose-stag.yml" for staging and "docker-compose-prod.yaml" for prodiction environment. Below are the command docker compose commands as per requirement. 
     'docker-compose up' --- To run the three different microservices separately
     'docker-compose -f docker-compose.yml -f docker-compose.prod.yml up' --- To run the environment specific docker compose files.
