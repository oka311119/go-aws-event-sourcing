.PHONY: clean build 

clean:
	rm -rf ./bin

build: clean
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/cmd cmd/main.go
