# syntax=docker/dockerfile:1

# Build Stage
FROM golang:1.23.1 as go-build

WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod .
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy all source files
COPY . .

# Build the Go application
RUN go build -o /tmp/main ./core/main.go  # Adjust if the path to main.go differs

# Final Stage
FROM rockylinux:9

WORKDIR /app

# Copy the built application from the previous stage
COPY --from=go-build /tmp/main ./app
FROM golang:1.23.1




# Copy the entrypoint script
COPY docker/container.entrypoint.sh ./

# Ensure the entrypoint script is executable
RUN chmod +x container.entrypoint.sh

# Expose the port your app will run on
EXPOSE 8080

# Set the entrypoint
ENTRYPOINT ["/app/container.entrypoint.sh"]
