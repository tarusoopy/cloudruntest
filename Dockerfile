#FROM golang:1.15.7-alpine as dev

#ENV ROOT=/go/src/app
#ENV CGO_ENABLED 0
#WORKDIR ${ROOT}

#RUN apk update && apk add git
#COPY go.mod go.sum ./
#RUN go mod download
#EXPOSE 28080

#CMD ["go", "run", "main.go"]


FROM golang:1.15.7-alpine as builder
#FROM golang:1.15.7-alpine

ENV ROOT=/go/src/app
WORKDIR ${ROOT}

RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download

COPY . ${ROOT}
RUN CGO_ENABLED=0 GOOS=linux go build -o $ROOT/binary


#FROM scratch as prod
FROM scratch

ENV ROOT=/go/src/app
WORKDIR ${ROOT}
COPY --from=builder ${ROOT}/binary ${ROOT}

EXPOSE 28080
CMD ["/go/src/app/binary"]
