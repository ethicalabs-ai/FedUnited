
# FedUnited-1.0

A lightweight federated learning demo using Flower, running on a Raspberry Pi 5 (16GB).

This project trains a simple image classifier on the Retinal OCT dataset (from MedMNIST) while keeping compute requirements minimal.

The goal is to demonstrate collaborative AI training on sensitive medical data without centralizing it.


## Running with Docker

### Prerequisites

- Docker installed on your Raspberry Pi
- Data file `data_N.npz` in the `./data` directory

### Quick Start

1. Clone this repository
2. Place your dataset in `./data/data_15.npz`
3. Run the following command:

```bash
docker compose up
```

### Environment Variables
Configure the client node by modifying these environment variables in `docker-compose.yaml`:

| Variable         | Default Value                   | Description                                                                 |
|------------------|---------------------------------|-----------------------------------------------------------------------------|
| `SUPERLINK`      | `"fedunited.flower.ai:443"`     | Flower SuperLink address for federation coordination                        |
| `NODE_DATA_PATH` | `"/app/data/data_15.npz"`       | Path to local dataset inside container (mount via volumes in compose file)  |

Example configuration:

```yaml
environment:
  SUPERLINK: "your.federation.server:443"
  NODE_DATA_PATH: "/app/data/your_dataset.npz"
```

### Volume Mounting

Map local data directories to the container by modifying the volumes section:

```yaml
volumes:
  - /path/to/your/local/data:/app/data
```

## How It Works

1. Client nodes connect to the Flower SuperLink
2. The central server coordinates the federated training process
3. Each client trains locally on its private Retinal OCT data
4. Only model updates (not raw data) are shared with the server
5. The server aggregates updates to improve the global model

## License

Apache License 2.0 - See [LICENSE](LICENSE) for details.
