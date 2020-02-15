docker-server:
	GOOS=linux go build -o kubeyaml-server ./cmd/server

kubeyaml:
	go build -o kubeyaml ./cmd/kubeyaml

kubeyaml-server:
	go build -o kubeyaml-server ./cmd/server

.PHONY: clean

clean:
	rm -f kubeyaml kubeyaml-server

kubeyaml-linux:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags '-s -w' -o kubeyaml ./cmd/kubeyaml
	tar zcfv kubeyaml_linux_amd64.tar.gz kubeyaml

kubeyaml-darwin:
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -ldflags '-s -w' -o kubeyaml ./cmd/kubeyaml
	tar zcfv kubeyaml_darwin_amd64.tar.gz kubeyaml
