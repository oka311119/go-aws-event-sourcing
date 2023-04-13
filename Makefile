.PHONY: build deploy

build:
	sam build

validate:
	sam validate --lint

deploy: build validate
	sam deploy --guided

local:
	sam local invoke
# aws cloudformation delete-stack --stack-name スタック名