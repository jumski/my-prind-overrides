#!/bin/sh
docker run \
  --rm \
  --volume $(pwd)/config/build.config:/opt/klipper/.config \
  --volume $(pwd)/out:/opt/klipper/out \
  --interactive \
  --tty \
  --device /dev/ttyACM0:/dev/ttyACM0 \
  -e FLASH_DEVICE=/dev/ttyACM0 \
  mkuf/klipper:nightly-mcu \
    bash -c "cd /opt/klipper; make menuconfig && make && make flash"
