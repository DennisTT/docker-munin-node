image:
	docker build -t dennistt/munin-node .

clean_image:
	docker build --no-cache -t dennistt/munin-node .

run_server:
	docker run -it -p 8080:80 --name=munin-node-test -e "PLUGINS=load" --rm dennistt/munin-node:latest

run_console:
	docker run -it -p 8080:80 --name=munin-node-test -e "PLUGINS=load" --rm --entrypoint /bin/bash -it dennistt/munin-node:latest

console:
	docker exec -it munin-node-test sh

push:
	docker push dennistt/munin-node
