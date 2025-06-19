#!/bin/bash

SUPERLINK="fedunited.flower.ai:443"
NODE_DATA_PATH="/Users/ethicalabs/Workspace/FedUnited/data/data_15.npz"

uv run flower-supernode --superlink="${SUPERLINK}" --node-config="data-path='${NODE_DATA_PATH}'"
