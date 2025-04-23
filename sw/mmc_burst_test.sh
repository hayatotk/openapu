#!/bin/bash
dd if=/dev/zero of=/dev/mmcblk2 bs=512 count=1024 oflag=direct start=0 status=progress | sync
