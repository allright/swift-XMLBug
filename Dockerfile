FROM swift:4.2 as builder

# For local build, add `--build-arg env=docker`
# In your application, you can use `Environment.custom(name: "docker")` to check if you're in this env
ARG env

RUN apt-get -qq update && apt-get -q -y install \
  tzdata \
  && rm -r /var/lib/apt/lists/*

RUN swift --version

ADD . /src
RUN ls -al /src

WORKDIR /src
RUN swift test
