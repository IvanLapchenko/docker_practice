.SILENT:run

run: 
	docker network create --attachable custom_network

	docker volume create database
	docker volume create logs

	docker container run -d -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword --name database second_database
	docker network connect custom_network database
	docker network disconnect bridge database

	docker container create -it  --name golang first_go
	docker network connect custom_network golang
	docker network disconnect bridge golang
	docker container start golang
	
stop:
	@docker container rm -f database
	@docker container rm -f golang
	@docker network rm custom_network
	