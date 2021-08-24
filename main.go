package main

import (
	"fmt"
	"github.com/valyala/fasthttp"
)

func main() {
	requestHandler := func(ctx *fasthttp.RequestCtx) {
		fmt.Fprintf(ctx, "hello fasthttp")
	}
	s := &fasthttp.Server{
		Handler: requestHandler,
		Name:    "Cloud Run API Server",
	}
	address := "0.0.0.0" + ":" + "28080"
	if err := s.ListenAndServe(address); err != nil {
		fmt.Errorf("error in ListenAndServe: %s", err)
	}

}
