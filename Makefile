build:
	docker build -t facerkut-v2 .

exec:
	docker exec -it facerkut-v2 bash

initialize:
	docker run -v $(PWD):/app -it --rm --name facerkut-v2-initialize --network dockernet facerkut-v2 mix deps.get

bash:
	docker run -p 5004:4000 -v $(PWD):/app -it --rm --name facerkut-v2-run --network dockernet facerkut-v2 bash

run:
	docker run -v $(PWD):/app -it --rm --name facerkut-v2-run --network dockernet facerkut-v2 $(COMMAND)

start:
	docker run -p 5004:4000 -v $(PWD):/app --rm --name facerkut-v2 --network dockernet facerkut-v2 mix phoenix.server

start_d:
	docker run -p 5004:4000 -v $(PWD):/app --rm --name facerkut-v2 --network dockernet facerkut-v2 mix phoenix.server

stop:
	docker rm -f facerkut-v2
