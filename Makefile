all: build clean run

clean:
	docker images prune

run: 
	docker-compose up -d
build:
	docker build -t hello-rocket .
builder-image:
	docker build -f builder.Dockerfile -t hello-rocket-builder .
