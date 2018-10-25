FROM ubuntu:trusty
MAINTAINER Alex Newman <thanhnghiacntt@gmail.com>

# Let the container know that there is no TTY
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages for proper system state
RUN apt-get -y update && apt-get install -y \
    install build-essential git cmake pkg-config \
	libbz2-dev libstxxl-dev libstxxl1v5 libxml2-dev \
	libzip-dev libboost-all-dev lua5.2 liblua5.2-dev libtbb-dev \
	libluabind-dev libluabind0.9.1v5 

RUN mkdir -p /osrm-build \
 && mkdir -p /osrm-data

WORKDIR /osrm-build

RUN curl --silent -L https://github.com/Project-OSRM/osrm-backend/archive/v5.19.0.tar.gz -o v5.19.0.tar.gz \
 && tar xzf v5.19.0.tar.gz \
 && mv osrm-backend-5.19.0 /osrm-src \
 && cmake /osrm-src \
 && make \
 && mv /osrm-src/profiles/car.lua profile.lua \
 && mv /osrm-src/profiles/lib/ lib \
 && echo "disk=/tmp/stxxl,25000,syscall" > .stxxl \
 && rm -rf /osrm-src

# Cleanup --------------------------------

RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Publish --------------------------------

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5000