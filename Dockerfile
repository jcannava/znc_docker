FROM ubuntu:16.04

# Generate locale files
RUN locale-gen en_US.UTF-8

# Export it
ENV LANG en_US.UTF-8

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Setup for galera/mariadb
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libperl-dev pkg-config \
                       swig3.0 libicu-dev python-software-properties \
                       software-properties-common znc znc-dbg znc-dev \
                       znc-perl znc-python znc-tcl
RUN /usr/bin/znc --makeconf
