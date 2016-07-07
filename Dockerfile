## BUILDING
##   (from project root directory)
##   $ docker build -t ngehani-omrails .
##
## RUNNING
##   $ docker run -p 5432:5432 ngehani-omrails
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:5432
##     replacing DOCKER_IP for the IP of your active docker host
##
## NOTES
##   This is a prebuilt version of PostgreSQL.
##   For more information and documentation visit:
##     https://github.com/bitnami/bitnami-docker-postgresql

FROM gcr.io/bitnami-containers/postgresql:9.5.3-r0

LABEL com.bitnami.stacksmith.id="wdo5j98" \
      com.bitnami.stacksmith.name="ngehani/omrails"

ENV STACKSMITH_STACK_ID="wdo5j98" \
    STACKSMITH_STACK_NAME="ngehani/omrails" \
    STACKSMITH_STACK_PRIVATE="1" \
    BITNAMI_CONTAINER_ORIGIN="stacksmith"

