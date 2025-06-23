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

# Change default IP to 192.168.5.1
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Set timezone to CST-8 (Shanghai)
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Set AdGuardHome as upstream DNS
sed -i '/option resolvfile/a\        list server '\''127.0.0.1:5353'\''' package/network/services/dnsmasq/files/dhcp.conf

# Create docker group
sed -i '/system.ntp/a\\t\tgroupadd -g 1000 docker' package/base-files/files/etc/init.d/boot

# Change AdGuardHome listening port
sed -i 's/0.0.0.0:53/0.0.0.0:5353/g' package/luci-app-adguardhome/root/etc/config/AdGuardHome
sed -i 's/0.0.0.0:53/0.0.0.0:5353/g' package/adguardhome/files/init.d/AdGuardHome
