all : 
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up

fclean :
	docker compose -f ./srcs/docker-compose.yml down

rm_volume : 
	docker volume rm wordpress_data mariadb_data 2> /dev/null
