# 安装rosetta，m1芯片无法直接执行intel的软件，需要通过rosetta进行转译
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# 安装Apple无法检查其是否包含恶意软件的命令，这个命令可以跳过一些签名验证来安装一些浏览器中下载的软件
sudo spctl --master-disable