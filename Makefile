up:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker compose -f srcs/docker-compose.yml up -d
	@make ps

down:
	@docker compose -f srcs/docker-compose.yml down
	@make ps

restart:
	@docker compose -f srcs/docker-compose.yml restart
	@make ps

build:
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --build -d
	@make ps

fclean:
	@docker rm -f $(shell docker ps -a -q)
	@docker volume ls -q
	@docker volume prune -f
	@docker image rm -f $(shell docker image ls -a -q)
	rm -rf $(HOME)/data/wordpress
	rm -rf $(HOME)/data/mariadb
	@make ps
	

re:
	@make down
	@make build

ps:
	@docker ps
