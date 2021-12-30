FROM ubuntu:16.04

ARG USER
ARG GROUP
ARG UID
ARG GID
ARG LOCALES

# set the locale
RUN set -ex; \
# sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list; \
    apt-get update; \
    apt-get -y --no-install-recommends install locales; \
    for l in ${LOCALES}; do locale-gen $l; done;

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    groupadd -g "${GID}" "${GROUP}"; \
    useradd -r -m -u "${UID}" -g "${GROUP}" "${USER}"; \
    apt-get -y --no-install-recommends install \
        glabels \
        glabels-data \
    ; \
    rm -rf /var/lib/apt/lists/*
    

USER "${USER}"

# CMD /usr/bin/sh
CMD tail -f /dev/null
