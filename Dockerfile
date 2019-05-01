FROM debian:buster

ENTRYPOINT ["neomutt"]

ENV NEOMUTTRC /home/neomutt/.config/neomutt/neomuttrc

WORKDIR /home/neomutt

VOLUME ["/home/neomutt/.config/neomutt"]

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		libsasl2-modules=2.1.27+dfsg-1 \
		neomutt=20180716+dfsg.1-1 \
		vim=2:8.1.0875-2 \
	&& rm -rf /var/apt/lists/* \
	&& useradd -m neomutt \
	&& mkdir /home/neomutt/Mail /var/mail/neomutt

USER neomutt

