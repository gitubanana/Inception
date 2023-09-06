VOLUME_PATH=/home/taeypark/data
VOLUME_DIR=/wordpress /mariadb /adminer
VOLUME_PATHS=$(addprefix $(VOLUME_PATH), $(VOLUME_DIR))
VOLUME_NAMES=wordpress_data mariadb_data adminer_data
IMAGE_NAME=nginx wordpress mariadb vsftpd adminer
TAG_NAME=:inception
IMAGES=$(addsuffix $(TAG_NAME), $(IMAGE_NAME))

all :
	sudo mkdir -p $(VOLUME_PATHS)
	docker compose -f ./srcs/docker-compose.yml up -d

bonus :
	make all

build: rm_image
	docker compose -f ./srcs/docker-compose.yml build

logs :
	cd srcs && docker compose logs -f

fclean :
	docker compose -f ./srcs/docker-compose.yml down

rm_image : fclean
	@if [ -n "$(shell docker images | grep wordpress)" ]; then \
		docker rmi -f $(IMAGES); \
	else \
		echo "이미지 없음"; \
	fi

rm_volume : fclean
	@if [ -n "$(shell docker volume ls | grep wordpress_data)" ]; then \
		docker volume rm $(VOLUME_NAMES); \
		sudo rm -rf $(VOLUME_PATHS); \
	else \
		echo "볼륨 없음"; \
	fi

.PHONY: all bonus build logs fclean rm_image rm_volume