FROM golang:1.14.4-alpine as gobuild

WORKDIR /go/src/rocks

COPY . .

RUN CGO_ENABLED=0 go build -o /rocks rocks.go

FROM scratch

COPY --from=gobuild /rocks /rocks

CMD ["/rocks"]