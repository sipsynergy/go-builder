FROM golang:alpine

# Install git (required by godeps)
RUN apk update && apk add --no-cache git

# Install godeps
WORKDIR /go/src
RUN go get github.com/tools/godep

# This is where your applications source code should be linked to via a volume.
RUN mkdir -p /go/src/app
