FROM caddy:builder AS builder

RUN xcaddy builder \
    --with github.com/mastercactapus/caddy2-proxyprotocol

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
