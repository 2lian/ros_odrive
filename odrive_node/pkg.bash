#!/bin/bash
set -e -o pipefail

for arch in "linux-64" "linux-aarch64" ; do
for distro in humble jazzy kilted; do
    rm ./pixi.toml
    ln -s ./pixi-$distro.toml ./pixi.toml

    pixi build \
        --output-dir ./$arch \
        --target-platform $arch
done
done
