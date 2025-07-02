FROM crystallang/crystal:1.16.3-alpine AS builder

ENV CRYSTAL_ENV production
WORKDIR /app

COPY shard.yml shard.lock ./
RUN shards install --production

COPY src/ src/
RUN crystal build src/frozen_layer.cr --release --static -o /app/server

FROM alpine:latest AS runner
ENV CRYSTAL_ENV production
COPY --from=builder /app/server /usr/local/bin/server
EXPOSE 3000
CMD ["server"]
