#!/usr/bin/env bash

toolbox rm rpios-toolbox -f || true
toolbox rmi trow.laurel.lagrange-automation.io/rpios-toolbox:42.20250525.0-dev.0

bash ./build-local.sh

toolbox create rpios-toolbox \
  --image trow.laurel.lagrange-automation.io/rpios-toolbox:42.20250525.0-dev.0
toolbox --log-level debug enter rpios-toolbox
