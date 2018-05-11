all: compile run

init:
	docker run -it --rm -v $(PWD):/home/ -v $(PWD)/.m2:/root/.m2 -w /home/ maven:3.5-jdk-8 mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

compile:
	docker run -it --rm -v $(PWD)/my-app/:/home/my-app/ -v $(PWD)/.m2:/root/.m2 -w /home/my-app maven:3.5-jdk-8 mvn package

run:
	docker run -it -v $(PWD)/my-app/:/home/my-app/ -w /home/my-app maven:3.5-jdk-8 java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
