VOLUME_PATH=${HOME}/data
VOLUME_DIR=/wordpress /mariadb /adminer /filebrowser
VOLUME_PATHS=$(addprefix $(VOLUME_PATH), $(VOLUME_DIR))
VOLUME_NAMES=wordpress_data mariadb_data adminer_data filebrowser_data
IMAGE_NAME=nginx wordpress mariadb vsftpd adminer redis-cache filebrowser
TAG_NAME=:inception
IMAGES=$(addsuffix $(TAG_NAME), $(IMAGE_NAME))

all :
	sudo mkdir -p $(VOLUME_PATHS)
	docker compose -f ./srcs/docker-compose.yml up -d

bonus :
	make all

build: rmImage
	docker compose -f ./srcs/docker-compose.yml build

logs :
	cd srcs && docker compose logs -f

fclean :
	docker compose -f ./srcs/docker-compose.yml down

rmImage : fclean
	@if [ -n "$(shell docker images | grep wordpress)" ]; then \
		docker rmi -f $(IMAGES); \
	else \
		echo "No docker images to remove."; \
	fi

rmVolume : fclean
	@if [ -n "$(shell docker volume ls | grep wordpress_data)" ]; then \
		docker volume rm $(VOLUME_NAMES); \
		sudo rm -rf $(VOLUME_PATHS); \
	else \
		echo "No docker volumes to remove."; \
	fi

re : fclean
	make all

.PHONY: all bonus build logs fclean rmImage rmVolume
