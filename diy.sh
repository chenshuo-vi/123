#修改默认登录地址
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#下载主题应用
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/chenshuo-l/luci-theme-argon.git package/luci-theme-argon
#rm -rf feeds/luci/themes/luci-theme-design
#git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design

#修改主题
sed -i 's/luci-theme-bootstrap/luci-theme-design/g' feeds/luci/collections/luci/Makefile

#修改wifi信息
#5g
sed -i 's/Channel=36/Channel=44/g' package/emortal/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/SSID1=OpenWrt/SSID1=qqq_5G/g' package/emortal/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/AuthMode=OPEN/AuthMode=WPA2PSK/g' package/emortal/mt-drivers/mt_wifi/files/mt7615.dat
sed -i '1,/EncrypType=NONE/s/EncrypType=NONE/EncrypType=AES/' package/emortal/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=987654321/g' package/emortal/mt-drivers/mt_wifi/files/mt7615.dat

#2g
sed -i 's/Channel=6/Channel=11/g' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/SSID1=OpenWrt_2G/SSID1=qqq/g' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/AuthMode=OPEN/AuthMode=WPA2PSK/g' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat
sed -i '1,/EncrypType=NONE/s/EncrypType=NONE/EncrypType=AES/' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=987654321/g' package/emortal/mt-drivers/mt_wifi/files/mt7603.dat

#添加插件
#sed -i 's/luci-app-filetransfer/luci-app-autoreboot/g' include/target.mk
sed -i '/luci-lib-fs/a \	luci-app-autoreboot \\' include/target.mk
#sed -i '/luci-lib-fs/a \	luci-app-filebrowser \\' include/target.mk
sed -i '/luci-lib-fs/a \	luci-app-ttyd \\' include/target.mk

#设置定时重启插件
sed -i 's/3/7/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot
sed -i '6s/0/1/' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot

#删除upnp dropbear turboacc eqos mwan3helper
#sed -i 's/luci-app-upnp\ //g' target/linux/ramips/mt7621/target.mk
#sed -i '/dropbear/d' include/target.mk
#sed -i 's/ipv6helper\ //g' target/linux/ramips/Makefile
#sed -i 's/luci-app-eqos-mtk\ //g' target/linux/ramips/Makefile
#sed -i 's/luci-app-turboacc-mtk\ //g' target/linux/ramips/Makefile
#sed -i 's/luci-app-mwan3helper-chinaroute\ //g' target/linux/ramips/mt7621/target.mk

#修复日志错误
#sed -i '/restart/d' feeds/luci/applications/luci-app-autoreboot/root/etc/init.d/autoreboot
#rm -rf target/linux/ramips/mt7621/base-files/etc/init.d/set-irq-affinity
#sed -i 's/loglevel:-5/loglevel:-9/g' package/utils/busybox/files/cron
#删除wan6接口，关闭ipv6
#sed -i '19,32d' package/network/services/ppp/files/lib/netifd/ppp6-up
#sed -i '/dhcpv6/d' package/network/services/odhcpd/files/odhcpd.defaults
#sed -i '/dhcp.lan.ra/d' package/network/services/odhcpd/files/odhcpd.defaults
#sed -i '/uci/d' package/emortal/ipv6-helper/files/60-ipv6-hybrid
