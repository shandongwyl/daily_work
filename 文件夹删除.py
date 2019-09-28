# -*- coding: utf-8 -*-
"""
Created on Sun Jul 28 19:29:29 2019

@author: wangyangliu
"""

import sys,os,shutil
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        #获取当前路径
        currDir = "D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]
#递归删除
        def removeFile(dire,toDel):
            if os.path.isdir(dire):
                for file in os.listdir(dire):
                    if file == toDel:
                        shutil.rmtree(dire+'/'+toDel)
                    else:
                        removeFile(dire+'/'+file,toDel)


#执行删除操作，这里"FileName"是需要删除的文件夹名称
        removeFile(currDir,"时间")