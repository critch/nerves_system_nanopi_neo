#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
  -n "nerves boot script" -d $NERVES_DEFCONFIG_DIR/uboot-script.cmd \
  $BINARIES_DIR/boot.scr

cp $HOST_DIR/../build/uboot-2016.11/u-boot-sunxi-with-spl.bin $BINARIES_DIR

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
