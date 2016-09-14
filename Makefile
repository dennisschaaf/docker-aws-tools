
all: build push

build:
	docker build -t bugcrowd/aws-tools .

push:
	docker push bugcrowd/aws-tools
