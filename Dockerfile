FROM golang:alpine as gobuild

WORKDIR /go/src/rocks

COPY . .

RUN go build -o /rocks rocks.go

FROM scratch

COPY --from=gobuild /rocks /rocks

CMD ["/rocks"]