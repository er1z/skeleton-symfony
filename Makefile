up:
	CONTAINER_UID=`id -u` \
	CONTAINER_GID=`id -g` \
	docker-compose up -d

rebuild:
	CONTAINER_UID=`id -u` \
	CONTAINER_GID=`id -g` \
	docker-compose build

shell:
	@docker-compose exec --user `id -u` app_app zsh

cs-fix:
	@docker-compose exec -T app_app vendor/bin/php-cs-fixer fix

down:
	@docker-compose down
