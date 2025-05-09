FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git lynis sudo mailutils openssh-client && \
    apt-get clean

WORKDIR /audit
COPY run-lynis.sh .
RUN chmod +x run-lynis.sh

CMD ["./run-lynis.sh"]
