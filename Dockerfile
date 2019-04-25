FROM debian:buster

RUN apt-get update \
		&& apt-get install -y --no-install-recommends \
				neomutt \
				vim \
		&& useradd -m neomutt \
		&& mkdir /home/neomutt/Mail /var/mail/neomutt

WORKDIR /home/neomutt

VOLUME ["/home/neomutt/.config/neomutt"]

USER neomutt

ENTRYPOINT ["neomutt"]

