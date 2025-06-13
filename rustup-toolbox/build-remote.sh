#!/usr/bin/env bash

set -euo pipefail

# "--destination=trow.laurel.lagrange-automation.io/k8s-mediaserver-operator:dev-4"
REGISTRY="trow.laurel.lagrange-automation.io"
REPOSITORY="admin-toolbox"

VERSION="v38.0.0"
RELEASE="-dev.0"
TAG="${VERSION}${RELEASE}"

BUILD_NS="default"

export DESTINATION="${REGISTRY}/${REPOSITORY}:${TAG}"

tar -cf - Dockerfile | gzip -9 | \
  kubectl run kaniko \
  --namespace "$BUILD_NS" \
  --rm --stdin=true \
  --image=gcr.io/kaniko-project/executor:latest --restart=Never \
  --overrides="$(envsubst < kaniko-overrides.tmpl.json)"
