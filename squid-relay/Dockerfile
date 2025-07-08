FROM golang:1.24 AS build-env
ADD . /app
WORKDIR /app

ARG CGO_ENABLED=0

RUN go mod download
RUN go build -ldflags="-s -w" -o /go/bin/app

FROM gcr.io/distroless/static-debian12
COPY --from=build-env /go/bin/app /
CMD ["/app"]
