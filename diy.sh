#修改默认登录地址
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#下载主题应用
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/chenshuo-l/luci-theme-argon.git package/luci-theme-argon

#修改主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#修改wifi信息
#5g
sed -i 's/Channel=36/Channel=40/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/SSID1=OpenWrt/SSID1=qwerts_5G/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/AuthMode=OPEN/AuthMode=WPA2PSK/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.dat
sed -i '1,/EncrypType=NONE/s/EncrypType=NONE/EncrypType=AES/' package/kernel/mt-drivers/mt_wifi/files/mt7615.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=pikapika1987./g' package/kernel/mt-drivers/mt_wifi/files/mt7615.dat

#2g
sed -i 's/Channel=6/Channel=11/g' package/kernel/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/SSID1=OpenWrt_2G/SSID1=qwerts/g' package/kernel/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/AuthMode=OPEN/AuthMode=WPA2PSK/g' package/kernel/mt-drivers/mt_wifi/files/mt7603.dat
sed -i '1,/EncrypType=NONE/s/EncrypType=NONE/EncrypType=AES/' package/kernel/mt-drivers/mt_wifi/files/mt7603.dat
sed -i 's/WPAPSK1=12345678/WPAPSK1=pikapika1987./g' package/kernel/mt-drivers/mt_wifi/files/mt7603.dat

#添加定时重启插件
sed -i 's/luci-app-filetransfer/luci-app-autoreboot/g' include/target.mk
#sed -i '/luci-lib-fs/a \	luci-app-autoreboot \\' include/target.mk
#设置定时重启插件
sed -i 's/3/7/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot
sed -i '6s/0/1/' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot

#删除upnp
sed -i 's/luci-app-upnp\ //g' target/linux/ramips/mt7621/target.mk

#关闭防火墙
#sed -i '3s/1/0/' package/network/config/firewall/files/firewall.config
