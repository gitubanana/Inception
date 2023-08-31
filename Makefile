VOLUME_DIR=/home/taeypark/data
WP_VOLUME=$(addprefix $(VOLUME_DIR), /wordpress)
DB_VOLUME=$(addprefix $(VOLUME_DIR), /mariadb)

all :
	sudo mkdir -p $(WP_VOLUME) $(DB_VOLUME)
	docker compose -f ./srcs/docker-compose.yml up -d

bonus :
	make all

build: 
	docker compose -f ./srcs/docker-compose.yml build

logs :
	cd srcs && docker compose logs -f

fclean :
	docker compose -f ./srcs/docker-compose.yml down

rm_volume : fclean
	@if [ -n "$(shell docker volume ls | grep wordpress_data)" ]; then \
		docker volume rm wordpress_data mariadb_data; \
		sudo rm -rf $(VOLUME_DIR); \
	else \
		echo "볼륨 없음"; \
	fi

.PHONY: all build logs fclean rm_volume