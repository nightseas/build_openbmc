# OpenBMC Auto-build Scripts

This environnment implements OpenBMC image auto-build functions with example configuraiton and bug fix for generic platforms, e.g. Raspberry Pi, AST2500-EVB.

### How-tos

Fetch and run auto-build scripts.

```sh
git clone https://github.com/nightseas/build_openbmc openbmc
cd openbmc/scripts

# Build image for Raspberry Pi 3
./build-obmc-rpi.sh
```

Program image to SD card.

```sh
# Images built for Raspberry Pi 3 are in this folder below
cd ../build/openbmc-rpi/build/tmp/deploy/images/raspberrypi3/

# Change sdX to your SD card
sudo dd if=obmc-phosphor-image-raspberrypi3.rpi-sdimg of=/dev/sdX bs=10M
```

### Proxy

If you are working behind firewall and need proxy service, uncomment scripts in ... by removing "#" and replace 'http://proxy.example.com:8080' to your proxy server annd port number.

Refer to the [Yocto Project Mega-Manual](https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html) for more information.
