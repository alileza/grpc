FROM alileza/grpc-gen:0.4.1 AS base

FROM node:12.18.3-alpine AS ts

COPY --from=base /third_party /third_party
COPY --from=base /go/bin/protoc-gen-go /bin/protoc-gen-go
COPY --from=base /go/bin/protoc-gen-grpc-gateway /bin/protoc-gen-grpc-gateway
COPY --from=base /go/bin/protoc-gen-swagger /bin/protoc-gen-swagger
COPY --from=base /go/bin/protoc-gen-validate /bin/protoc-gen-validate

RUN apk add protobuf-dev

RUN npm install -g ts-proto ts-protoc-gen