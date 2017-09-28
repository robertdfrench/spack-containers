distros = $(shell ls -d */)

all: $(patsubst %, spackcontainers/%, $(distros))
	@echo "Done!"

install: $(patsubst %, docker.io/spackcontainers/%, $(distros))
	@echo "Done!"

spackcontainers/%: %
	docker build $< --tag $@:latest

docker.io/spackcontainers/%: spackcontainers/%
	docker push $@:latest
