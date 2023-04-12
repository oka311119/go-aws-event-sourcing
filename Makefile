.PHONY: build deploy

build:
	sam build

deploy:
	sam deploy --guided

build-HelloWorldFunction:
	GOOS=linux GOARCH=arm64 go build -o bootstrap
	cp ./bootstrap $(ARTIFACTS_DIR)/.