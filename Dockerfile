FROM golang:alpine

ARG SSH_KEY

# Install git (required by godeps)
RUN apk update && apk add --no-cache git curl openssh-client gcc g++

# Install godeps
WORKDIR /go/src

RUN go get -v github.com/tools/godep

# Install glide
RUN go get -v github.com/Masterminds/glide

# Install ginkgo and friends
RUN go get -v github.com/onsi/ginkgo/ginkgo
RUN go get -v github.com/onsi/gomega

RUN export "PATH=$PATH:$GOPATH/bin"
ENV GO111MODULE=on

# Make sure we have the host key
RUN mkdir ~/.ssh
RUN ssh-keyscan rsa github.com > ~/.ssh/known_hosts

# Update git to force github connection of SSH
RUN git config --global url.git@github.com:.insteadOf https://github.com/

# This is where your applications source code should be linked to via a volume.
RUN mkdir -p /go/src/app
