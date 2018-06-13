DOCKER_IMAGE=maven:3.5-jdk-8
APP_NAME=sample-app
APP_PACKAGE=com.somecompany.app

all: compile run

init:
	docker run -it --rm -v $(PWD):/home/ -v $(PWD)/.m2:/root/.m2 -w /home/ $(DOCKER_IMAGE) mvn archetype:generate -DgroupId=$(APP_PACKAGE) -DartifactId=$(APP_NAME) -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

compile:
	docker run -it --rm -v $(PWD)/$(APP_NAME):/home/$(APP_NAME) -v $(PWD)/libs:/home/$(APP_NAME)/libs -v $(PWD)/.m2:/root/.m2 -w /home/$(APP_NAME) $(DOCKER_IMAGE) mvn package

run:
	docker run -it --rm -v $(PWD)/$(APP_NAME):/home/$(APP_NAME) -v $(PWD)/libs:/home/$(APP_NAME)/libs -w /home/$(APP_NAME) $(DOCKER_IMAGE) java -cp target/$(APP_NAME)-1.0-SNAPSHOT.jar:libs/* $(APP_PACKAGE).App
