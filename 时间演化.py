# -*- coding: utf-8 -*-
"""
Created on Sat Jul 27 21:21:39 2019

@author: wangyangliu
"""
#import numpy as np
import os
import pandas as pd
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        #cur_dir = "D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]
        #folder_name = '时间1'
        #if os.path.isdir(cur_dir):
            #os.mkdir(os.path.join(cur_dir, folder_name))
        filename="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"zonghe.csv"
        filename1="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"AF.csv"
        csv=pd.read_csv(filename)
        csv1=pd.read_csv(filename1)
        a=csv["PY"]#提取时间
        b=csv["EY"]#提取时间
        c=pd.concat([a,b])
        d=c.unique()#提取时间种类
        d=d[~pd.isnull(d)]#去除空值
        d.sort()
        L=[]
        A=[]
        for k in range(len(d)):
            t=csv[a==d[k]]
            t1=csv[b==d[k]]
            T=pd.concat([t,t1]).sort_index()
            T1=T.index
            for k1 in range(len(T1)):
                L.append(csv.irow(T1[k1]))
            L1=pd.DataFrame(L)    
            #A=[]
            for l in range(len(T1)):
                A.append(csv1.irow(T1[l]))
            h=L1["TC"]
            h1=pd.DataFrame(h)
            #e=L1["PY"]
            #f=L1["EY"]
            #g=pd.concat([e,f])
            #g=g[~pd.isnull(g)]
           # g=pd.DataFrame(g)
            #A1=pd.DataFrame(A)
            #A1.to_csv(("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"时间1"+"/shijian"+str(d[k])+"作者.csv"),index=False )
            #L1.to_csv(("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"时间2"+"/shijian"+str(d[k])+"作者.csv"),index=False )
           # T.to_csv(("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"时间综合"+"/shijian"+str(d[k])+"zonghe.csv" ))
            h1.to_csv(("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"时间4"+"/被引"+str(d[k])+".csv"),index=False )
        