FROM ubuntu:16.04

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libperl-dev pkg-config \
                       swig3.0 libicu-dev python-software-properties \
                       software-properties-common znc znc-dbg znc-dev \
                       znc-perl znc-python znc-tcl
RUN mkdir -p /var/lib/znc
RUN useradd \
    --home /var/lib/znc \
    --system \
    --user-group znc \
    && chown -R znc:znc /var/lib/znc
