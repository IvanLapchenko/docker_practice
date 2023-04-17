.SILENT:run

run:
	docker network create --attachable custom-network

	docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword --name database postgres
	docker run -it --name golang go_image

	docker network connect my-bridge-network database
	docker network connect my-bridge-network golang


stop:
	docker network rm custom-network

