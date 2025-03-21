NAME = inception
WEB_DIR = ~/data


all: create_dir $(NAME)

create_dir:
	mkdir -p $(WEB_DIR)/mariadb
	mkdir -p $(WEB_DIR)/wordpress

$(NAME): up


up:
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker exec -it wordpress sh -c "rm -rf /var/www/html/*"
	docker exec -it mariadb sh -c "rm -rf /var/lib/mysql/*"
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker rmi mariadb_image nginx_image wordpress_image

fclean: clean
	docker system prune -af
	docker volume prune -f
	rm -rf $(WEB_DIR)

re: clean all

.PHONY: all create_dir $(NAME) up down clean re fclean
