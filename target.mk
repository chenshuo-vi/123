#
# Copyright (C) 2009 OpenWrt.org
#

SUBTARGET:=mt7621
BOARDNAME:=MT7621 based boards
FEATURES+=nand ramdisk rtc usb minor
CPU_TYPE:=24kc
KERNELNAME:=vmlinux vmlinuz
# make Kernel/CopyImage use $LINUX_DIR/vmlinuz
IMAGES_DIR:=../../..

DEFAULT_PACKAGES += wpad-basic-wolfssl swconfig kmod-ramips_hnat wireless-tools l1profile\
			iptables-mod-ipopt iptables-mod-conntrack-extra mtkhqos_util\

define Target/Description
	Build firmware images for Ralink MT7621 based boards.
endef
