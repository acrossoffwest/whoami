FROM golang:1.9-alpine3.6 AS binary
ADD . /app
WORKDIR /app
RUN go build -o http
ENV PORT 8000
EXPOSE 8000
COPY /app/http /app
CMD ["/app/http"]
