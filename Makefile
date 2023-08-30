VOLUME_DIR=/home/taeypark/data
WP_VOLUME=$(addprefix $(VOLUME_DIR), /wordpress)
DB_VOLUME=$(addprefix $(VOLUME_DIR), /mariadb)

all :
	sudo mkdir -p $(WP_VOLUME) $(DB_VOLUME)
	docker compose -f ./srcs/docker-compose.yml up -d

build: 
	docker compose -f ./srcs/docker-compose.yml build

logs :
	cd srcs && docker compose logs -f

fclean :
	docker compose -f ./srcs/docker-compose.yml down

rm_volume :
	docker volume rm wordpress_data mariadb_data 2> /dev/null
	sudo rm -rf $(VOLUME_DIR)
