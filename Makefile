wp:
	bash wp.sh

plugins:
	bash plugin.sh

build:
	bash build.sh

start:
	docker compose up --build -d

stop-all:
	docker compose down --rmi all --volumes --remove-orphans

clean-all:
	docker system prune -a --volumes -f

restart: stop-all clean-all start