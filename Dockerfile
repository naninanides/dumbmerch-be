FROM golang:1.18-alpine as distroless
WORKDIR /home/app
COPY . .
RUN CGO_ENABLED=0  go build

#distroless
FROM gcr.io/distroless/cc-debian11
WORKDIR /home/app
COPY --from=distroless /home/app /home/app
CMD ["/home/app/dumbmerch"]
