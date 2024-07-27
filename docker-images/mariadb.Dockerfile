FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install -y mariadb-server && \
    apt clean

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 3306

ENTRYPOINT ["/start.sh"]