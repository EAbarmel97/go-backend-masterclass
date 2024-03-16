FROM postgres:16-alpine3.19

COPY uncomment_port.sh /docker-entrypoint-initdb.d/uncomment_port.sh

RUN chmod +x /docker-entrypoint-initdb.d/uncomment_port.sh