package main

import (
	"embed"
	"log"
	"net/http"
)

var (
	//go:embed hello_world.png foo.png bar.png lorem.png ipsum.png
	images embed.FS
)

func main() {
	staticHandler := http.FileServer(http.FS(images))
	err := http.ListenAndServe(":3333", staticHandler)

	if err != nil {
		log.Fatalf("Problem launching the server: %v", err)
	}
}
