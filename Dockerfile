FROM golang:1.15-alpine

# install protobuf
RUN apk add --update protobuf git bash

# Get the source from GitHub
RUN go get google.golang.org/grpc
# Install protoc-gen-go
RUN go get github.com/golang/protobuf/protoc-gen-go
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get github.com/envoyproxy/protoc-gen-validate

COPY ./third_party /third_party
