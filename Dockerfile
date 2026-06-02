# ---- Build stage: render the mdBook into static HTML ----
FROM alpine:3.20 AS build

ARG MDBOOK_VERSION=0.5.3
RUN apk add --no-cache curl tar \
    && curl -sSL "https://github.com/rust-lang/mdBook/releases/download/v${MDBOOK_VERSION}/mdbook-v${MDBOOK_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
       | tar -xz -C /usr/local/bin

WORKDIR /book
COPY . .
RUN mdbook build

# ---- Serve stage: tiny nginx serving the static output ----
FROM nginx:1.27-alpine
COPY --from=build /book/book /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
