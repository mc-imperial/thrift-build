FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get -y install \
    automake bison cmake flex g++ git libevent-dev libssl-dev libtool make pkg-config \
    gcc-mingw-w64 \
    git golang wget zip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV \
  GOPATH=/data/gopath \
  PATH=/data/gopath/bin:${PATH}

COPY . /data/

WORKDIR /data

RUN \
  mkdir -p ${GOPATH} && \
  go get github.com/c4milo/github-release

CMD ["./build_and_release.sh"]

