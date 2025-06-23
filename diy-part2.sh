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

sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

sed -i '/option resolvfile/a\        list server '\''127.0.0.1#5053'\''' package/network/services/dnsmasq/files/dhcp.conf

sed -i '/system.ntp/a\\t\tgroup add docker' package/base-files/files/etc/init.d/boot
