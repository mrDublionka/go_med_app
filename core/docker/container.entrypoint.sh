#!/bin/sh

# Execute air with the correct config path
exec /root/go/bin/air -c /core/.air.toml -- all:start
