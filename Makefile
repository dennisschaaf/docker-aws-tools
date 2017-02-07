all: rmi build push

rmi:
	docker rmi bugcrowd/aws-tools || true

build:
	docker build -t bugcrowd/aws-tools .

push:
	docker push bugcrowd/aws-tools
