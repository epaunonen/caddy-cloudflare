FROM caddy:2.8.4-builder@sha256:b6569c53816600efe0a7a6116172ed82c0c8ffaf66ab39082745c8225532bdcd AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:bd748561278a46dc31d2c0fad01bef168e1598945e74952786d1470bc4fc4fdc

COPY --from=builder /usr/bin/caddy /usr/bin/caddy