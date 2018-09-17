FROM golang:latest

WORKDIR /go

ADD etym /go/src/etym/

RUN cd /go/src/etym/ && sh build/unpack.sh && build/build.sh

RUN cd /go/src/etym/dist/ && tar -zxvf etym.tar.gz

WORKDIR /go/src/etym/dist

CMD ["./etymd", "-f", "./configs/etymd.config.toml"]

expose 9009
