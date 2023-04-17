.SILENT:run
run: 
	docker volume create storage
	docker volume create logs
	docker network create my_network
	docker run -d -v storage:/var/lib/postgresql/data -v logs:/var/log/postgresql -p 5403:5432 --name database -e POSTGRES_PASSWORD=docker database
	docker network disconnect bridge database
	docker network connect my_network database

	docker container create -it --env-file env --name golang golang
	docker network disconnect bridge golang
	docker network connect my_network golang
	docker start golang
stop:
	docker rm -f  golang
	docker rm -f database
	docker network rm my_network
	

