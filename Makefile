PROJECT_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

build:
	docker build -t pulumi_demo_project:latest -f Dockerfile .

run:
	docker run -it --name pulumi_demo_project --rm -p 8080:80 pulumi_demo_project:latest

run-local:
	docker run \
		-it --rm \
		--name pulumi_demo_project \
		-p 8080:80 \
		--mount type=bind,source=$(PROJECT_ROOT)/content,target=/usr/share/nginx/html \
		--mount type=bind,source=$(PROJECT_ROOT)/conf,target=/etc/nginx/conf.d \
		pulumi_demo_project:latest
