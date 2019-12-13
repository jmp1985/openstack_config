#!/bin/bash

set -e

DIRECTORY=$(dirname $0)

bash ${DIRECTORY}/packages/setup.sh
bash ${DIRECTORY}/postfix/setup.sh
bash ${DIRECTORY}/heartbeat/setup.sh
