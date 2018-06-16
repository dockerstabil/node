FROM node:10.4.1-stretch

# workdir
RUN mkdir -p /app
WORKDIR /app

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
RUN curl -o- --location https://yarnpkg.com/install.sh | bash
