#!/usr/bin/env bash
touch test.go

echo "package main
import (
  \"fmt\"
)

func main() {
  fmt.Println(\"Hello world\")
}" > test.go

go run test.go

bash