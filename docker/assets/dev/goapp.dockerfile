# syntax=docker/dockerfile:1
FROM golang:1.23.1

RUN go install github.com/air-verse/air@latest
RUN go install github.com/maruel/panicparse/v2@latest

