#!/usr/bin/python

# Date: 2021-06-16 20:07:19
# LastEditors: LaBiXiaoChen
# LastEditTime: 2021-06-17 10:59:19
# FilePath: \undefinedc:\Users\23689\Desktop\Function-script-library\python脚本\刷git仓库贡献值\duplicateContributionValueScript.py

# 导入系统操作os库,导入延时器函数time库
import os,time



contributeNumber = int(input('请输入想要贡献的次数值，次数越多，脚本运行时间越长:'))
waitTime = int(input('请输入每次准备等待的时间:'))
hub = input("请问你想上传的网站是github还是gitee:")


# git提交代码函数
def gitPush():
    os.system('git add .')
    os.system('git commit -m co')
    if(hub == 'gitee'):
        os.system('git push --set-upstream origin master')
    else:
        os.system('git push --set-upstream origin main')



# 添加文件函数
def inset():
    f = open('newFile.txt','w+')
    f.write('newContent')
    f.close()
    gitPush()


# 删除文件函数
def delete():
    os.remove('./newFile.txt')
    gitPush()

#提前删除文件，防止出现本地存在的问题
def deleteFile():
    if(os.path.exists("./newFile.txt")):
        os.remove('./newFile.txt')


# sign代表仓库状态，1代表有文件提交到仓库中了，0代表将文件删除之后再次提交到仓库中
sign = 1

deleteFile()
# 进行多次提交
for i in range(contributeNumber):
    if(sign==1):
        inset()
        sign=0
    else:
        delete()
        sign = 1
    time.sleep( waitTime )
    # 延时五秒之后再次执行这个提交函数







