# -*- coding: utf-8 -*-
"""
Created on Sun Jul 28 21:51:38 2019

@author: wangyangliu
"""

import os
import pandas as pd
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        cur_dir = "D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]
        folder_name = '时间4'
        if os.path.isdir(cur_dir):
            os.mkdir(os.path.join(cur_dir, folder_name))