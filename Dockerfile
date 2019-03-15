FROM golang:1.11.0-stretch

LABEL "io.cycloid"="Cycloid" \
      "description"="A docker image of MailSlurper SMTP server" \
      "reference"="https://github.com/mailslurper/mailslurper"

ARG MSP_VER
WORKDIR /go/src
RUN mkdir -p github.com/mailslurper/mailslurper \
    && cd github.com/mailslurper/mailslurper \
    && git clone https://github.com/mailslurper/mailslurper.git . \
    && git checkout $MSP_VER \
    && go get github.com/mjibson/esc \
    && cd cmd/mailslurper \
    && go get \
    && go generate \
    &&  go build \
    && go install \
    && cd ../createcredentials \
    &&  go build \
    && go install \
    && mkdir -p /mailslurper

WORKDIR /mailslurper
CMD ["mailslurper"]
