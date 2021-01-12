FROM alpine:latest
LABEL maintainer="Wells Wei <wellsgz@hotmail.com>"

WORKDIR /root
RUN set -ex \
    && apk add --no-cache ca-certificates tzdata unzip curl\
    && wget -q "$(curl -Ls https://git.io/Jtvoz | grep -wo "https.*linux-amd64-.*.tar.gz")" \
    && ls dnsproxy* | tail -1 | xargs tar zxfv \
    && cp ./linux-amd64/dnsproxy /usr/local/bin \
    && rm -rf /root/*

ENTRYPOINT ["/usr/local/bin/dnsproxy"]
