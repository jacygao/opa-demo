package main

import (
	"fmt"
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
	http.HandleFunc("/product", order)
	log.Println("starting product service on port 8002")
	http.ListenAndServe(":8002", nil)
}
