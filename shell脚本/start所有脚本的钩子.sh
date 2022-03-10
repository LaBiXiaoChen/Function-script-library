# 使用shell脚本时,只需要打开此文件,然后对指定脚本赋予权限,即可选择脚本进行执行,省去了找脚本的麻烦

# 此脚本需要包含的功能
# 1.要能赋予其他脚本权限
# 2.对其他脚本能直接使用执行
# 3.能进行终端菜单显示和用户选择
# 4.能反馈执行情况

echo '欢迎您来到我的bash脚本系统中'
# say 'welcome my dear sir,enjoy'

# 前期环境搭建
# 安装常用必备的工具
# wget安装
brew install wget
# tree安装
brew install tree
# neofetch 显示苹果logo
brew install neofetch
# fish shell安装
brew install fish
# sl安装，一个会跑的火车
brew install sl

echo '我现在在给我的脚本们提升权限'
# TODO:脚本批量提升权限问题还未解决,钩子脚本未完成
chmod 755 -R ./*