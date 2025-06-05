#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Clean up dependencies
#find feeds -name Makefile -exec dirname {} \; | grep -wE 'brook|gn|chinadns-ng|dns2socks|dns2tcp|hysteria|ipt2socks|microsocks|naiveproxy|redsocks2|sagernet-core|shadowsocks-rust|shadowsocksr-libev|simple-obfs|sing-box|ssocks|tcping|trojan|trojan-go|trojan-plus|v2ray-core|v2ray-geodata|v2ray-plugin|v2raya|xray-core|xray-plugin|lua-neturl|luci-app-ssr-plus|mosdns' | xargs rm -rf

# Modify default IP
sed -i 's/192.168.[0-9]\{1,3\}.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Modify default wifi name
sed -i 's|SSID1=OpenWrt_2G|SSID1=OpenWrt|g' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat #mt7603
sed -i 's|WPAPSK1=1234567890|WPAPSK1=12345678|g' package/emortal/mt-drivers/mt_wifi/files/mt7612.dat #mt7612

# Remove default password
#sed -i "s|sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow|sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow|g" package/emortal/default-settings/files/99-default-settings

# name: 替换默认主题 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon-new/' feeds/luci/collections/luci/Makefile

# Update Go to 1.21
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

#drop mosdns and v2ray-geodata packages that come with the source
#find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
#find ./ | grep Makefile | grep mosdns | xargs rm -f
#rm -rf feeds/packages/net/v2ray-geodata

#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

# Correct wan name for mt7621 single gmac device
#sed -i 's|os.execute("uci set network.wan.ifname=eth1")|os.execute("uci set network.wan.ifname=eth0.2")|g' package/emortal/luci-app-mtwifi/luasrc/controller/mtkwifi.lua
#sed -i 's|wanname="eth1"|wanname="eth0.2"|g' package/emortal/luci-app-mtwifi/luasrc/controller/mtkwifi.lua
