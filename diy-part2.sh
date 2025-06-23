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

# Fix AdGuardHome upstream DNS syntax
sed -i '/option resolvfile/a\\t\tlist server 127.0.0.1#5353' package/network/services/dnsmasq/files/dhcp.conf

# Create docker group with correct syntax
sed -i '/system.ntp/a\\t\tgroup_add 1000 docker' package/base-files/files/etc/init.d/boot

# Change AdGuardHome listening port
find package/ -type f -name 'AdGuardHome' -exec sed -i 's/0.0.0.0:53/0.0.0.0:5353/g' {} +
