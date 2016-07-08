## BUILDING
##   (from project root directory)
##   $ docker build -t ngehani-omrails .
##
## RUNNING
##   $ docker run -p 3000:3000 ngehani-omrails
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r07

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="p6ujuyp" \
    STACKSMITH_STACK_NAME="ngehani/omrails" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install ruby-2.2.5-1 --checksum 16f88a4d52a92934199a4d81c7146e064b9a0d06c9447ae202627736bbd691bf

ENV PATH=/opt/bitnami/ruby/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Ruby on Rails template
ENV RAILS_ENV=development

COPY Gemfile* /app/
WORKDIR /app

RUN bundle install --without production

COPY . /app

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
