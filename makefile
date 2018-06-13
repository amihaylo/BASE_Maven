DOCKER_IMAGE=maven:3.5-jdk-8

all: run

run:
	docker run --rm -it -w /home -v $(PWD)/my-app:/home -v $(PWD)/.m2:/root/.m2  $(DOCKER_IMAGE) mvn clean compile exec:java
