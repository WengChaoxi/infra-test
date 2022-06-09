ARG MONGODB_EXPORTER_VERSION=0.32.0

FROM --platform=$BUILDPLATFORM alpine:3.14.0 AS build
ARG MONGODB_EXPORTER_VERSION
ARG TARGETARCH
RUN set -x \
    && apk add --no-cache ca-certificates \
    && wget https://github.com/percona/mongodb_exporter/releases/download/v${MONGODB_EXPORTER_VERSION}/mongodb_exporter-${MONGODB_EXPORTER_VERSION}.linux-${TARGETARCH}.tar.gz \
    && tar xf mongodb_exporter-*.tar.gz \
    && mv /mongodb_exporter-*/mongodb_exporter /

FROM scratch AS final
USER 65535:65535
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /mongodb_exporter /

EXPOSE 9216
ENTRYPOINT ["/mongodb_exporter"]
