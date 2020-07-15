#! /bin/bash

set -o errexit -o nounset -o pipefail

ddev delete --omit-snapshot -y "ddev-contrib-project"
rm -rf "ddev-contrib-project"