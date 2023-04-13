# go-aws-event-sourcing

Event-Driven Hexagonal Architecture with AWS AppSync, AWS Lambda, and Amazon DynamoDB

## Overview

This project demonstrates an event-driven architecture with hexagonal architecture for business logic. The main components of this architecture are AWS AppSync for commands and queries, Amazon DynamoDB as the event store and read-only store, and AWS Lambda for handling business logic.

The architecture is designed as follows:

1. Cognito: Front-end authentication and login management
2. AppSync (command): Saves events to DynamoDB① using VTL templates
3. AppSync (query): Retrieves data from DynamoDB② using VTL templates
4. Lambda: Executes business logic, triggered by DynamoDB① event streams, and updates DynamoDB②
5. DynamoDB① (event)
6. DynamoDB② (read-only)

## Folder Structure

The folder structure is organized as follows:

``` go Copy code
├── cmd
│   └── main.go
├── internal
│   ├── appsync
│   │   ├── command
│   │   │   ├── resolver.go
│   │   │   ├── schema.graphql
│   │   │   └── template.vtl
│   │   └── query
│   │       ├── resolver.go
│   │       ├── schema.graphql
│   │       └── template.vtl
│   ├── businesslogic
│   │   ├── entity
│   │   ├── repository
│   │   └── usecase
│   ├── dynamodb
│   │   ├── event
│   │   │   └── handler.go
│   │   └── readonly
│   │       ├── client.go
│   │       └── repository.go
│   ├── lambda
│   │   ├── handler.go
│   │   └── dependencies.go
│   └── auth
│       └── cognito.go
├── pkg
│   ├── config
│   └── logger
├── template
│   └── cloudformation
│       ├── cognito.yaml
│       ├── dynamodb_event.yaml
│       ├── dynamodb_readonly.yaml
│       ├── lambda.yaml
│       ├── appsync_command.yaml
│       └── appsync_query.yaml
├── main.go
├── go.mod
└── go.sum
```

## Prerequisites

- Go (1.x or later)
- AWS CLI configured with your AWS account
- AWS SAM CLI

## Getting Started

1. Clone this repository:

``` bash Copy code
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
```

2. Configure your front-end application to use the deployed AWS resources (Cognito, AppSync, etc.).

``` bash
aws cognito-idp admin-create-user --user-pool-id USER_POOL_ID --username USERNAME
```

3. Compile and run the project & Deploy the AWS infrastructure using AWS CloudFormation:

``` bash Copy code
make deploy
```
