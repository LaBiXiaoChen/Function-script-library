#用于设置我的mac常用的命令别名，带有明显个人习惯，不方便分享，比较有较大的使用限制，本人默认使用fish shell进行操作

# TODO：未设置fish shell的shell环境情况
#输出默认shell
echo '正在输出默认shell'
echo $SHELL

#输出默认的环境变量
echo '输出默认的环境变量'
echo $PATH

# 创建~/.zshrc_profile
sudo touch ~/.zshrc_profile

#设置ls命令
echo "已设置alias ll='ls -la'"
sudo echo "alias ll='ls -la'" > ~/.zshrc_profile

sudo echo "alias logo='neofetch'" > ~/.zshrc_profile

# 启用zshrc_profile文件
source ~/.zshrc_profile