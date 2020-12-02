FROM ubuntu:latest

ARG IN_FILE="sqlite3-create.sh"

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      sqlite3

WORKDIR /usr/local

COPY bin/ .

RUN chmod +x ${IN_FILE}

CMD "/usr/local/sqlite3-create.sh"
