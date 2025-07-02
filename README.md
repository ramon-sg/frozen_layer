# Cr Layer

A GraphQL caching layer built with Crystal 🚀

## Development

### Dependencies
- [Crystal](https://crystal-lang.org/install/) 💎
- [Docker](https://docs.docker.com/get-docker/) 🐳
- [Docker Compose](https://docs.docker.com/compose/install/) 🐙
- [watchexec](https://watchexec.github.io) 👀

### Run Watch
```bash
dev/start
```

## Docker Compose 🐳

### Quick Start
```bash
# Build and start all services
docker compose up --build
```

### Services
- **frozen-layer** 🚀 - Main application (port 3003)
- **redis** 🔴 - Cache storage

### Configuration
The application uses `config.docker.json` for Docker environment configuration:
- GraphQL endpoint: `http://host.docker.internal:3000/graphql`
- Redis connection: `redis://redis:6379/0`

#### Docker Configuration Example
```json
{
  "graphqlUrl": "http://host.docker.internal:3000/graphql",
  "storeUrl": "redis://redis:6379/0",
  "storeConnectionPoolSize": 1000,
  "operationsMap": {
    "searchProduct": {
      "expiration": "1m",
      "enabled": true
    }
  }
}
```

**Key Settings:**
- `graphqlUrl`: Upstream GraphQL server URL (accessible from Docker container)
- `storeUrl`: Redis connection string (using Docker service name)
- `storeConnectionPoolSize`: Number of Redis connection pool connections
- `operationsMap`: Cache configuration for specific GraphQL operations

## Docker Hub Publishing 🚀

The project includes an automated GitHub Action that builds and publishes Docker images to Docker Hub:

- **Trigger**: Automatically runs on push to `main` branch or pull requests
- **Image Name**: `ramonsoto/frozen-layer:v{version}`
- **Version**: Extracted from `shard.yml` file

### Usage
Once running, the application will be available at:
- **Health Check**: `http://localhost:3003/version`
- **GraphQL Cache**: `http://localhost:3003/`

### Example Requests
```bash
# Check version
curl http://localhost:3003/version

# GraphQL query (cached)
curl -X POST http://localhost:3003/ \
  -H "Content-Type: application/json" \
  -d '{"query": "query { __typename }"}'
```