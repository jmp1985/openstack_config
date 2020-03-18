#!/bin/bash

set -e

DIRECTORY=$(dirname $0)

bash ${DIRECTORY}/packages/setup.sh
bash ${DIRECTORY}/repositories/setup.sh
