#!/bin/bash

# 设置变量
username="aduuu111"
password="aduuu888"
port="51014"

# 切换到用户主目录
cd ~

# 从 x-ui 官方 GitHub 仓库下载最新版本（请替换为正确的URL）
wget -c https://github.com/vaxilu/x-ui/releases/download/0.3.2/x-ui-linux-amd64.tar.gz

# 解压缩文件
tar zxvf x-ui-linux-amd64.tar.gz

# 移除原压缩包
rm -f x-ui-linux-amd64.tar.gz

# 移动解压后的目录到 /usr/local
mv x-ui /usr/local/

# 赋予权限
cd /usr/local/x-ui
chmod +x x-ui bin/xray-linux-amd64

# 拷贝 systemd 服务文件并启用
cp -f x-ui.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable x-ui

# 设置 x-ui 的用户名和密码
/usr/local/x-ui/x-ui setting -username $username -password $password

# 设置 x-ui 的端口
/usr/local/x-ui/x-ui setting -port $port

# 启动 x-ui 服务
systemctl start x-ui

# 打印设置信息
echo ""
echo ""
echo ========================
echo "UI Port: $port"
echo "Username: $username"
echo "Password: $password"
echo ========================
echo "Installation Completed."
