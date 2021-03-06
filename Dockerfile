FROM resin/raspberry-pi-debian

ENV INITSYSTEM on

RUN apt-get -q update && apt-get install -yq --no-install-recommends \
	build-essential curl file \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get install -qq

WORKDIR /usr/src/app

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

RUN ls -a

COPY . /usr/src/app

RUN cargo build

CMD ./target/debug/resin-rust-hello-world