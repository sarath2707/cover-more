This page consists of docker images and compose files which are created to display the basic setup of an application by using the three diferent microservices which are flask, react and laravel. Below are the two different types of approaches which are (1) Running three different microservices seperately in localsetup (2) Running the three microservices combined by using the dockerfile which can generate image and it can be deployed in the docker/kubernetes environment. Using multi-stage docker build to redcue the image size of the microservice.

1. With the using of Docker Compose Yaml
- If we run "docker-compose.yml" then all the microservices will be installed seperately in the local setup
- To run the environment specific configuration, use the "docker-compose-dev.yml" for development, "docker-compose-stag.yml" for staging and "docker-compose-prod.yaml" for prodiction environment. Below are the command docker compose commands as per requirement. 
     - `docker-compose up` --- To run the three different microservices separately
     - ` docker-compose -f docker-compose.yml -f docker-compose.prod.yml up` --- To run the environment specific docker compose files.

2. Dockerfile (which is present in this page) can run all the threee microservices at a time by building the docker image using below command
   -  `docker build -t combined-microservices .` --- building the combined microservices with the help of Dockerfile which generates the image
   - `docker run -t combined-microservices:1` --- this command will run the image with the combined-microservices of 1st version as a tag 

NOTE: All the dockerfiles are written by assuming the very basic conditions and the environment configuration can be changed accorinding to requirement under the environment section in the docker-compose yaml files.
