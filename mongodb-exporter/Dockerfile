ARG BUILD_PLATFORM=linux/amd64
ARG CPU_ARCH=amd64
ARG MONGODB_EXPORTER_VERSION=0.32.0

FROM --platform=$BUILD_PLATFORM alpine AS builder
RUN apk add --no-cache ca-certificates

ARG CPU_ARCH
ARG MONGODB_EXPORTER_VERSION
ADD https://github.com/percona/mongodb_exporter/releases/download/v${MONGODB_EXPORTER_VERSION}/mongodb_exporter-${MONGODB_EXPORTER_VERSION}.linux-${CPU_ARCH}.tar.gz .
RUN tar xf mongodb_exporter-*.tar.gz && mv /mongodb_exporter-*/mongodb_exporter /

FROM scratch AS final
USER 65535:65535
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /mongodb_exporter /

EXPOSE 9216
ENTRYPOINT ["/mongodb_exporter"]

