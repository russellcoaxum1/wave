FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y screen procps wget curl git python3 python3-pip dos2unix \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN dos2unix run_setup.sh

RUN chmod +x run_setup.sh

ENTRYPOINT ["bash"]
