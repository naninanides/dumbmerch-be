FROM golang:1.18-alpine as builder
WORKDIR /home/app
COPY . .
RUN go build

FROM golang:1.18-alpine
WORKDIR /home/app
COPY --from=builder /home/app /home/app
CMD ["/home/app/dumbmerch"]
