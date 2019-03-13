package main

import (
	"encoding/json"
	"net/http"
)

type healthResponse struct {
	Status string
}

func healthz(w http.ResponseWriter, req *http.Request) {
	json.NewEncoder(w).Encode(healthResponse{Status: "ok"})
}
