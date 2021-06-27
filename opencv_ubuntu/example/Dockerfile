FROM placket/ubuntu-opencv:build-stage as builder

WORKDIR /app/src

COPY . .

RUN g++ `pkg-config --libs --cflags opencv4` main.cpp

FROM placket/ubuntu-opencv:build-stage as production

COPY --from=builder /app/src/main /main

ENTRYPOINT ["/main"]
