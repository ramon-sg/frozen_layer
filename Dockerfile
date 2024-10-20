FROM crystallang/crystal:latest AS builder

ENV CRYSTAL_ENV production

RUN apt-get update && apt-get install -y \
  libssl-dev libxml2-dev libyaml-dev libgmp-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN shards install --production
RUN crystal build src/frozen_layer.cr --release --static -o /app/server

FROM alpine:latest AS runner

ENV CRYSTAL_ENV production

COPY --from=builder /app/server /usr/local/bin/server

EXPOSE 3000

CMD ["server"]
