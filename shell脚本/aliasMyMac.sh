#用于设置我的mac常用的命令别名，本人默认使用fish shell进行操作

echo '此脚本只对fish进行操作，下面将会对你的mac安装fish shell'
brew install fish
echo 'fish shell 已经安装成功'

#输出默认shell
echo '正在输出默认shell'
echo $SHELL

#输出默认的环境变量
echo '输出默认的环境变量'
echo $PATH

#设置ls命令
echo "abbr -a l ls -al复制到文本 ~/.config/fish/config.fish"
sudo echo "abbr -a ll 'ls -la'" >> ~/.config/fish/config.fish

echo "alias -a logo neofetch复制到文本 ~/.config/fish/config.fish"
sudo echo "abbr -a logo neofetch" >> ~/.config/fish/config.fish

# 启动配置到环境中
echo '启动配置到环境中'
source ~/.config/fish/config.fish