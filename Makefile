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

rebuild:
	docker compose down --rmi all --volumes --remove-orphans
	docker system prune -a --volumes -f
	rm -rf ./wp/**
	rm -rf ./build/**
	rm -rf ./plugins/**
	rm -rf ./wordpress/**
	bash wp.sh
	bash plugin.sh
	bash build.sh
	docker compose up --build -d
	@echo http://localhost:8080