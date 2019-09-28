# -*- coding: utf-8 -*-
"""
Created on Sat Aug 17 15:52:24 2019

@author: wangyangliu
"""

import os
import pandas as pd
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        #cur_dir = "D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]
        #folder_name = '时间综合'
        #if os.path.isdir(cur_dir):
            #os.mkdir(os.path.join(cur_dir, folder_name))
        filename="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"zonghe.csv"
        csv=pd.read_csv(filename)
        a=csv["PY"]#提取时间
        b=csv["EY"]#提取时间
        c=pd.concat([a,b])
        c=c[~pd.isnull(c)].sort_index()
        C=pd.DataFrame(c)
        C.to_csv("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"时间.csv",index=False)