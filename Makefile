compile-app:
	docker build --target builder -t flaskhello:latest . && docker rmi flaskhello:latest && echo "Code successfully compiled!!" || (echo  "Code have compilation issue"; exit 1)

## Local targets 
local-build-app:
	docker-compose build
local-run-app:
	docker-compose up -d
	sleep 2; docker-compose ps
local-build-run-app:	build-app run-app

local-clean-app:
	docker-compose down 
	sleep 2; docker-compose ps
