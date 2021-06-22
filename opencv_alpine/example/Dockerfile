FROM placket/gocv_mine:4.5.2-alpine as builder

WORKDIR /app/src

COPY . .

RUN go get -u -d gocv.io/x/gocv

RUN go build main.go

FROM placket/gocv_mine:4.5.2-alpine_runtime

COPY --from=build-stage /app/src/main /main

ENTRYPOINT ["/main"]
