bla = $(shell pwd)
build:
	docker build -t docker-postgres-backup .

buildrestic:
	docker run --rm -v "$(bla):/data" golang /bin/bash -c "git clone https://github.com/restic/restic && cd restic && go run build.go && cp restic /data/restic_app"

push:
	docker tag docker-postgres-backup rosscdh/docker-postgres-backup:12.3
	docker push rosscdh/docker-postgres-backup:12.3


