#!/bin/sh
#scrip to change Postgres listening port inside the postgres container
sed -i "s/#port = 5432/port = 8080/"  /var/lib/postgresql/data/postgresql.conf