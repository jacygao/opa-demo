package main

import (
	"fmt"
	"log"
	"net/http"
)

func order(w http.ResponseWriter, req *http.Request) {
	switch req.Method {
	case "GET":
		res, err := http.Get("http://localhost:8001/order")
		if res != nil {
			defer res.Body.Close()
		}
		if err != nil {
			fmt.Fprintf(w, err.Error())
			return
		}
		fmt.Fprintf(w, "GET %s \n", req.URL)
	case "POST":
		res, err := http.Post("http://localhost:8001/order", "", nil)
		if res != nil {
			defer res.Body.Close()
		}
		if err != nil {
			fmt.Fprintf(w, err.Error())
			return
		}
		fmt.Fprintf(w, "POST %s \n", req.URL)
	default:
	}
}

func product(w http.ResponseWriter, req *http.Request) {
	switch req.Method {
	case "GET":
		res, err := http.Get("http://localhost:8002/product")
		if res != nil {
			defer res.Body.Close()
		}
		if err != nil {
			fmt.Fprintf(w, err.Error())
			return
		}
		fmt.Fprintf(w, "GET %s \n", req.URL)
	case "POST":
		res, err := http.Post("http://localhost:8002/product", "", nil)
		if res != nil {
			defer res.Body.Close()
		}
		if err != nil {
			fmt.Fprintf(w, err.Error())
			return
		}
		fmt.Fprintf(w, "POST %s \n", req.URL)
	default:
	}
}

func main() {
	http.HandleFunc("/order", order)
	log.Println("starting bff service on port 8000")
	http.ListenAndServe(":8000", nil)
}
