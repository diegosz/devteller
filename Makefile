mocks:
	mockgen -source pkg/providers/dotenv.go -destination pkg/providers/mock_providers/dotenv_mock.go

lint:
	golangci-lint run

test:
	go test -v ./pkg/... -cover

integration:
	go test -v ./pkg/integration_test -cover -tags=integration

integration_api:
	go test -v ./pkg/integration_test -cover -tags="integration_api integration"

deps:
	go mod tidy

build:
	go build -ldflags "-s -w -X main.version=0.0.0 -X main.commit=0000000000000000000000000000000000000000 -X main.date=2022-01-01"

.PHONY: deps lint mocks test integration integration_api build
