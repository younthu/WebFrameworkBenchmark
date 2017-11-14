package main

import (
	"fmt"
	"net/http"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	t := time.Now()

	fmt.Fprintf(w, t.Format("20060102150405"), r.URL.Path[1:])
}

func ioHandler(w http.ResponseWriter, r *http.Request) {
	time.Sleep( 700 * time.Millisecond)
	handler(w, r)
}

func main() {
	http.HandleFunc("/", handler)
	http.HandleFunc("/io", ioHandler)
	http.ListenAndServe(":8080", nil)
}
