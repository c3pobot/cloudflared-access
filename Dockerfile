FROM alpine/curl AS getter
RUN curl -L https://github.com/cloudflare/cloudflared/releases/download/2025.2.0/cloudflared-linux-amd64 --output cloudflared
RUN chmod a+x cloudflared

FROM alpine:3.21.3 AS app
LABEL org.opencontainers.image.source=https://github.com/c3pobot/cloudflared-access
ENV PORT=8080
COPY --from=getter cloudflared cloudflared
CMD ./cloudflared access tcp --hostname $CLOUDFLARE_SERVICE_HOSTNAME --url 0.0.0.0:$PORT
