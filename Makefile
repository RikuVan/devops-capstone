env:
ifeq ($(AWS_CREDENTIALS),)
	echo "Missing AWS_CREDENTIALS"
else
	echo "Credentials set to ${AWS_CREDENTIALS}"
endif
	java --version

test:
	./gradlew test

lint:
	./gradlew ktlint

run-gradle:
	./gradlew run

docker-build:
	docker build --build-arg AWS_BUCKET=capstone-276d89b4-f660 --build-arg AWS_CREDENTIALS=${AWS_CREDENTIALS} --build-arg BASIC_AUTH_CREDENTIALS=user:password --build-arg HTTP_PORT=8000 . -t rikuvan/capstone

docker-remove:
	docker image rm rikuvan/capstone

docker-run:
	docker run -p 8000:8000 -d --name capstone rikuvan/capstone


