FROM debian:buster

ENTRYPOINT ["neomutt"]

ENV NEOMUTTRC /home/neomutt/.neomuttrc

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	libsasl2-modules \
	lynx \
	neomutt \
	python3 \
	python3-pip \
	python3-setuptools \
	python3-wheel \
	urlscan \
	urlview \
	vim \
	w3m \
	&& rm -rf /var/apt/lists/* \
	&& useradd -m neomutt \
	&& mkdir /home/neomutt/Mail /var/mail/neomutt \
	&& pip3 install mutt_ics===0.9.2

WORKDIR /home/neomutt

USER neomutt

COPY --chown=neomutt muttimage.sh /home/neomutt/muttimage.sh

ARG COMMIT_SHA
ARG BRANCH_NAME
ARG BUILD_DATE

