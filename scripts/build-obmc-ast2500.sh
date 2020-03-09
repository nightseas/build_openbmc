#!/bin/bash

TEMPLATECONF=meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf

# Set git proxy for Yocto build behind firewall
source proxy_obmc_gitenv

# Fetch OpenBMC source
git clone https://github.com/openbmc/openbmc ../build/openbmc-ast2500
cd ../build/openbmc-ast2500

# Apply patches to OpenBMC
git am --abort
git am ../../patches/ast2500/*

# Build OpenBMC for Raspberry Pi
. openbmc-env
cp ../../../conf/ast2500.local.conf.sample ./conf/local.conf

bitbake obmc-phosphor-image

