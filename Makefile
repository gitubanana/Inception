VOLUME_DIR=/home/taeypark/data
WP_VOLUME=$(addsuffix /wordpress, $(VOLUME_DIR))
DB_VOLUME=$(addsuffix /mariadb, $(VOLUME_DIR))
IMAGE_NAME=nginx wordpress mariadb vsftpd
TAG_NAME=:inception
IMAGES=$(addsuffix $(TAG_NAME), $(IMAGE_NAME))

all :
	sudo mkdir -p $(WP_VOLUME) $(DB_VOLUME)
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
		docker volume rm wordpress_data mariadb_data; \
		sudo rm -rf $(VOLUME_DIR); \
	else \
		echo "볼륨 없음"; \
	fi

.PHONY: all build logs fclean rm_volume