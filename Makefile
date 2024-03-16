postgresdb:
	sudo docker-compose -f build/docker-compose.yml up --build --detach

createdb:
	sudo docker exec -it postgresdb createdb --username=EaBarmel --owner=EaBarmel -h localhost -p 8080 simple_bank

dropdb:
	sudo docker exec -it postgresdb dropdb --username=EaBarmel -h localhost -p 8080 simple_bank

.PHONY: postgresdb createdb dropdb



