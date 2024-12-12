up:
	@echo "\033[1;32mStarting containers...\033[0m"
	@mkdir -p $(HOME)/data/wordpress
	@echo "\033[1;32mWordpress volume direction created.\033[0m"
	@mkdir -p $(HOME)/data/mariadb
	@echo "\033[1;32mMariadb volume direction created.\033[0m"
	@docker compose -f srcs/docker-compose.yml up -d
	@echo "\033[1;32mDocker Compose file up now.\033[0m"
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@make ps
	@echo "\033[1;32mContainers succesfuly started.\033[0m"

down:
	@echo "\033[1;31mStopping containers...\033[0m"
	@docker compose -f srcs/docker-compose.yml down
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@make ps
	@echo "\033[1;31mContainers stopped.\033[0m"

restart:
	@echo "\033[1;33mRestarting containers...\033[0m"
	@docker compose -f srcs/docker-compose.yml restart
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@make ps
	@echo "\033[1;33mContainers restarted.\033[0m"

build:
	@echo "\033[1;34mBuilding and starting containers...\033[0m"
	@mkdir -p $(HOME)/data/wordpress
	@echo "\033[1;32mWordpress volume direction created.\033[0m"
	@mkdir -p $(HOME)/data/mariadb
	@echo "\033[1;32mMariadb volume direction created.\033[0m"
	@docker compose -f srcs/docker-compose.yml up --build -d
	@echo "\033[1;32mDocker Compose file builted now.\033[0m"
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@make ps
	@echo "\033[1;34mContainers built and started.\033[0m"

clean:
	@echo "\033[1;35mCleaning up...\033[0m"
	@docker rm -f $(shell docker ps -a -q)
	@echo "\033[1;35mDocker ps are removed.\033[0m"
	@docker volume ls -q
	@docker volume prune -f
	@echo "\033[1;35mDocker volume are removed.\033[0m"
	@docker image rm -f $(shell docker image ls -a -q)
	@echo "\033[1;35mDocker images are removed.\033[0m"
	rm -rf $(HOME)/data/wordpress
	@echo "\033[1;35mWordpress volume direction removed.\033[0m"
	rm -rf $(HOME)/data/mariadb
	@echo "\033[1;35mMariadb volume direction removed.\033[0m"
	@echo "\033[1;35mDocker ps ↓.\033[0m"
	@make ps
	@echo "\033[1;35mCleanup complete.\033[0m"

re:
	@echo "\033[1;36mRebuilding containers...\033[0m"
	@make down
	@make build
	@echo "\033[1;36mRebuild complete.\033[0m"

check:
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@docker ps
	@echo "\033[1;32mDocker volume ↓.\033[0m"
	@docker volume ls
	@echo "\033[1;32mDocker image ↓.\033[0m"
	@docker image ls
	@echo "\033[1;32mDocker network ↓.\033[0m"
	@docker network ls
ps:
	@echo "\033[1;32mDocker ps ↓.\033[0m"
	@docker ps

f:
	@echo "\033[1;32mDocker deleting forever, everythink!!!!!!!!!!!!!!!!!!!!!!!!!1 ↓.\033[0m"
	docker rm -f $$(docker ps -a -q)
	docker image rm -f $$(docker image ls -a -q)
	docker volume rm $$(docker volume ls -q)
	docker builder prune -a --force
	docker system prune -a --volumes --force