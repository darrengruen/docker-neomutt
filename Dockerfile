FROM debian:buster

ENTRYPOINT ["neomutt"]

ENV NEOMUTTRC /home/neomutt/.neomuttrc

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	libsasl2-modules=2.1.27+dfsg-1 \
	lynx=2.8.9rel.1-3 \
	neomutt=20180716+dfsg.1-1 \
	python3=3.7.2-1 \
	python3-pip=18.1-5 \
	python3-setuptools=40.8.0-1 \
	python3-wheel=0.32.3-2 \
	urlscan=0.8.2-1 \
	urlview=0.9-21 \
	vim=2:8.1.0875-3 \
	w3m=0.5.3-37 \
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

