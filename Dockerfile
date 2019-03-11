FROM golang:1.7

RUN wget http://storage.googleapis.com/kubernetes-release/release/v1.7.2/bin/linux/amd64/kubectl -O /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

ADD . /go/src/app/

RUN go-wrapper download
RUN cd /go/src/github.com/nlopes/slack && git checkout tags/v0.4.0
RUN go-wrapper install

CMD ["app"]
