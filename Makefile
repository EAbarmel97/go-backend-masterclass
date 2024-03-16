include build/.env

pgcontainerup:
	sudo docker compose -f build/docker-compose.yml up --build --detach

pgcontainerdown:
	sudo docker compose -f build/docker-compose.yml down

createdb:
	sudo docker exec -it postgresdb createdb --username=${POSTGRES_USER} --owner=${POSTGRES_USER} -h $(DB_HOST) -p ${DB_PORT} ${DB_NAME}

dropdb:
	sudo docker exec -it postgresdb dropdb --username=$(POSTGRES_USER) -h $(DB_HOST) -p $(DB_PORT) $(DB_NAME)

migrateup:
	sudo migrate -path db/migration -database "$(DB_URL)" -verbose up

migratedown:
	sudo migrate -path db/migration -database "$(DB_URL)" -verbose down

migrateversion:
	migrate -path db/migration -database "$(DB_URL)" version

sqlc:
	sqlc generate

.PHONY: postgresdbup postgresdbdown createdb dropdb migrateup migratedown migrateversion sqlc


