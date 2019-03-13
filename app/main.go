package main

import (
	"net/http"
)

func main() {

	http.HandleFunc("/healthz", healthz)
	err := http.ListenAndServe(":3000", nil)
	if err != nil {
		panic(err)
	}
}
