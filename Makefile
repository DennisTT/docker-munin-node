image:
	docker build -t docker.dennistt.net/dennis/munin-node .

clean_image:
	docker build --no-cache -t docker.dennistt.net/dennis/munin-node .

run_server:
	docker run -it -p 8080:80 --name=munin-node-test -e "PLUGINS=load" --rm docker.dennistt.net/dennis/munin-node:latest

run_console:
	docker run -it -p 8080:80 --name=munin-node-test -e "PLUGINS=load" --rm --entrypoint /bin/bash -it docker.dennistt.net/dennis/munin-node:latest

console:
	docker exec -it munin-node-test sh

push:
	docker push docker.dennistt.net/dennis/munin-node
