mv -f ./pixi.toml ./pixi.toml.bak
for arch in linux-64 linux-aarch64; do
    for distro in jazzy humble kilted; do

        rm ./pixi.toml
        ln -s ./pixi-$distro/pixi.toml ./pixi.toml

        pixi build \
            --output-dir ./$arch \
            --target-platform $arch
    done
done
mv -f ./pixi.toml.bak ./pixi.toml
