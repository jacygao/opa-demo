package main

import (
	"fmt"
	"net/http"
)

func order(w http.ResponseWriter, req *http.Request) {
	switch req.Method {
	case "GET":
		fmt.Fprintf(w, "GET %s \n", req.URL)
	case "POST":
		fmt.Fprintf(w, "POST %s \n", req.URL)
	default:
	}
}

func headers(w http.ResponseWriter, req *http.Request) {
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

func main() {
	http.HandleFunc("/order", order)
	http.HandleFunc("/headers", headers)

	http.ListenAndServe(":8090", nil)
}
