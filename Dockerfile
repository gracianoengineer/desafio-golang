
FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY go/ .

RUN CGO_ENABLED=0 go build -o /app app.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]
