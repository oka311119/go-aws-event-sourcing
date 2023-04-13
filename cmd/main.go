package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

type AppSyncEvent struct {
	Info AppSyncInfo `json:"info"`
}

type AppSyncInfo struct {
	FieldName string `json:"fieldName"`
}

func handler(request AppSyncEvent) (string, error) {
	return "Hello from AppSync and Lambda!", nil
}

func main() {
	lambda.Start(handler)
}
