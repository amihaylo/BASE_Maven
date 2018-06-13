DOCKER_IMAGE=maven:3.5-jdk-8
APP_NAME=sample-app
APP_PACKAGE=com.somecompany.app

all: run

run:
	docker run --rm -it -w /home -v $(PWD)/my-app:/home -v $(PWD)/.m2:/root/.m2  maven:3.5-jdk-8 mvn clean compile exec:java
