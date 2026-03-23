#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
echo "CONFIG_PACKAGE_luci-app-ssr-plus=y" >> .config
echo "CONFIG_PACKAGE_luci-app-smartdns=y" >> .config
echo "CONFIG_PACKAGE_luci-app-tinc=y" >> .config
echo "CONFIG_PACKAGE_luci-app-vlmcsd=y" >> .config
echo "CONFIG_PACKAGE_luci-app-vnstat=y" >> .config
echo "CONFIG_PACKAGE_luci-app-netdata=y" >> .config
echo "CONFIG_PACKAGE_https-dns-proxy=y" >> .config
# PVE 虚拟化驱动优化
echo "CONFIG_PACKAGE_kmod-virtio-net=y" >> .config
echo "CONFIG_PACKAGE_kmod-virtio-balloon=y" >> .config
# 扩容分区到 1G (防止 Netdata 撑爆)
echo "CONFIG_TARGET_KERNEL_PARTSIZE=64" >> .config
echo "CONFIG_TARGET_ROOTFS_PARTSIZE=1024" >> .config
