#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.

# Add required packages sources
echo 'src-git openclash https://github.com/vernesong/OpenClash' >> feeds.conf.default
echo 'src-git adguardhome https://github.com/rufengsuixing/luci-app-adguardhome' >> feeds.conf.default
echo 'src-git dockerman https://github.com/lisaac/luci-app-dockerman' >> feeds.conf.default

# Add kernel patches for J4125 stability
echo 'src-git kernel_patches https://github.com/coolsnowwolf/lede;master' >> feeds.conf.default
