APP_NAME=sample-app
APP_PACKAGE=com.somecompany.app

all: compile run

init:
	docker run -it --rm -v $(PWD):/home/ -v $(PWD)/.m2:/root/.m2 -w /home/ maven:3.5-jdk-8 mvn archetype:generate -DgroupId=$(APP_PACKAGE) -DartifactId=$(APP_NAME) -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

compile:
	docker run -it --rm -v $(PWD)/$(APP_NAME):/home/$(APP_NAME) -v $(PWD)/.m2:/root/.m2 -w /home/$(APP_NAME) maven:3.5-jdk-8 mvn package

run:
	docker run -it -v $(PWD)/$(APP_NAME):/home/$(APP_NAME) -w /home/$(APP_NAME) maven:3.5-jdk-8 java -cp target/$(APP_NAME)-1.0-SNAPSHOT.jar $(APP_PACKAGE).App
