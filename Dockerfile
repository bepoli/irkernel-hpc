FROM r-base:4.1.2

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN apt-get -y update && apt-get -y install \
        python3 \
        jupyter \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libgsl-dev \
        libhdf5-dev \
        libudunits2-dev \
        libgdal-dev \
        libfontconfig1-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        libcairo2-dev \
        libxt-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
