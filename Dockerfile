FROM node:15.5.0-stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get -qy update \
    # preliminaries
    && DEBIAN_FRONTEND=noninteractive apt-get -qy install apt-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get -qy install curl git gnupg unzip zip \
    # clean up
    && rm -rf /var/lib/apt/lists/*

#
# yarn
# https://yarnpkg.com/en/docs/install#alternatives-stable
#
RUN curl -o- --silent --show-error --location https://yarnpkg.com/install.sh | bash

# workdir
RUN mkdir -p /app \
    && chown -R node:node /app
WORKDIR /app


# fix "Error: EACCES: permission denied, scandir '/root/.npm/_logs'"
USER node
