FROM caddy:builder AS builder

RUN xcaddy build --with github.com/mastercactapus/caddy2-proxyprotocol --with github.com/imgk/caddy-trojan

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
