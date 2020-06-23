build-pylint:
	cd setupjenkins/pylint; docker build -t opsdaddy/pylint:1.0.0  .
setup-jenkins:
	cd setupjenkins; docker-compose build; docker-compose up -d;

compile-app:
	docker build --target builder -t flaskhello:latest . && docker rmi flaskhello:latest && echo "Code successfully compiled!!" || echo  "Code have compilation issue" && exit 1

build-app:
	docker-compose build
run-app:
	docker-compose up -d
	sleep 2; docker-compose ps
build-run-app:	build-app run-app

clean-app:
	docker-compose down 
	sleep 2; docker-compose ps
