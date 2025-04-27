docker_image = dennistt/munin-node
test_container_name = munin-node_test

image:
	docker buildx build --platform linux/arm64,linux/amd64 --pull --push -t $(docker_image):latest .

clean_image:
	docker buildx build --platform linux/arm64,linux/amd64 --pull --push --no-cache -t $(docker_image):latest .

run_server:
	docker run -it -p 8080:80 --name=$(test_container_name) -e "PLUGINS=load" --rm $(docker_image):latest

run_console:
	docker run -it -p 8080:80 --name=$(test_container_name) -e "PLUGINS=load" --rm --entrypoint /bin/bash -it $(docker_image):latest

console:
	docker exec -it munin-node-test sh
