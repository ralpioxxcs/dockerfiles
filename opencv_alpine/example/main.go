package main

import (
	"fmt"

	"gocv.io/x/gocv"
)

func main() {
	fmt.Println("gocv test")

	img := gocv.IMRead("Lenna.png", gocv.IMReadColor)
	wnd := gocv.NewWindow("lenna")
	wnd.IMShow(img)
	wnd.WaitKey(0)
}
