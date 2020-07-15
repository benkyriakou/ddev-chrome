#! /bin/bash

set -o errexit -o nounset -o pipefail

ddev delete --omit-snapshot -y "heddn-project"
rm -rf "heddn-project"