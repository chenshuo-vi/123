#修改默认登录地址
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#下载主题应用
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/chenshuo-l/luci-theme-argon.git package/luci-theme-argon

#修改主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

sed -i '/dropbear/d' include/target.mk

#添加定时重启插件
#sed -i 's/luci-app-filetransfer/luci-app-autoreboot/g' include/target.mk
sed -i '/luci-lib-fs/a \	luci-app-autoreboot \\' include/target.mk
#设置定时重启插件
sed -i 's/3/7/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot
sed -i '6s/0/1/' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot


#关闭防火墙
#sed -i '3s/1/0/' package/network/config/firewall/files/firewall.config
