#!/usr/bin/env bash

set -euo pipefail

dir="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")")"

source "${dir}/../.env"
REPOSITORY="$(basename "${dir}")"

export DESTINATION="${REGISTRY}/${REPOSITORY}:${TAG}"

podman build \
  -t "$DESTINATION" \
  .
