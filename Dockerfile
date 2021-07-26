FROM golang:1.9-stretch AS binary
ADD . /app
WORKDIR /app
RUN go build -o http

FROM debian:stretch
WORKDIR /app
ENV PORT 8000
EXPOSE 8000
COPY --from=binary /app/http /app
CMD ["/app/http"]
