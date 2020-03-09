#!/bin/bash

TEMPLATECONF=meta-evb/meta-evb-raspberrypi/conf

# Set git proxy for Yocto build behind firewall
source proxy_obmc_gitenv

# Fetch OpenBMC source
git clone https://github.com/openbmc/openbmc ../build/openbmc-rpi
cd ../build/openbmc-rpi

# Apply patches to OpenBMC
git am --abort
git am ../../patches/rpi/*

# Build OpenBMC for Raspberry Pi
. openbmc-env
cp ../../../conf/rpi.local.conf.sample ./conf/local.conf

bitbake obmc-phosphor-image

