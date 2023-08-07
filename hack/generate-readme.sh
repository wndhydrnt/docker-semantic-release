#! /usr/bin/env bash

set -e

description=$(jq -r '.description' package.json)
name=$(jq -r '.name' package.json)
node_version=$(grep -i 'FROM ' Dockerfile | cut -d ':' -f 2)
package_version_data=$(jq -r '.dependencies | keys[]  as $k | "\($k):\(.[$k])"' package.json)

pve=""
for v in $package_version_data; do
  package=$(echo "$v" | cut -d ':' -f 1)
  version=$(echo "$v" | cut -d ':' -f 2)
  pve="${pve}- [${package}: ${version}](https://www.npmjs.com/package/${package}/v/${version})\n"
done

# -e to turn \n into a new line
package_versions=$(echo -e "$pve")

cat << EOF
# ${name}

${description}.

Versions are being kept up-to-date by Renovate.

## Versions

### Docker Base Image

[Node](https://hub.docker.com/_/node): ${node_version}

### Packages

$package_versions
EOF
