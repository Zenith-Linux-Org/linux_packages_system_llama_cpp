#!/bin/bash
# llama-cpp daemon launcher for Zenith Linux
# Probes GPU, falls back to CPU threading
set -euo pipefail

MODEL="/usr/share/models/qwen-1.7b-q4_k_m.gguf"
HOST="127.0.0.1"
PORT="8080"

# GPU probe — check for DRI render node
GPU_LAYERS=32
THREADS=4
if [ ! -e /dev/dri/renderD128 ]; then
    echo "llama-cpp: no GPU found, falling back to CPU"
    GPU_LAYERS=0
    THREADS=$(nproc)
fi

echo "llama-cpp: starting server on $HOST:$PORT (gpu_layers=$GPU_LAYERS, threads=$THREADS)"
exec llama-server \
    -m "$MODEL" \
    --host "$HOST" \
    --port "$PORT" \
    --gpu-layers "$GPU_LAYERS" \
    --threads "$THREADS"
