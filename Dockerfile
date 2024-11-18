FROM caddy:builder AS builder

RUN xcaddy build \ 
    #--with github.com/mastercactapus/caddy2-proxyprotocol \
    --with github.com/imgk/caddy-trojan \
    --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive \
    --with github.com/mholt/caddy-l4 \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-events-exec \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/mholt/caddy-webdav 
    #--with github.com/jsonc-adapter

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
