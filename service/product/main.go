package main

import (
	"fmt"
	"log"
	"net/http"
)

func product(w http.ResponseWriter, req *http.Request) {
	switch req.Method {
	case "GET":
		fmt.Fprintf(w, "GET %s \n", req.URL)
	case "POST":
		fmt.Fprintf(w, "POST %s \n", req.URL)
	default:
	}
}

func main() {
	http.HandleFunc("/product", product)
	log.Println("starting product service on port 8080")
	http.ListenAndServe(":8080", nil)
}
