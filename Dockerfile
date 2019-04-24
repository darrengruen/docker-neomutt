FROM debian:buster

RUN apt-get update \
		&& apt-get install -y --no-install-recommends neomutt \
		&& useradd -m neomutt 

WORKDIR /home/neomutt

VOLUME ["/home/neomutt/.config/neomutt"]

USER neomutt

ENTRYPOINT ["neomutt"]

