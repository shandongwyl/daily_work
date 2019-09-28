# -*- coding: utf-8 -*-
"""
Created on Sun Jul 14 13:05:07 2019

@author: wangyangliu
"""

import os
import re
import pandas as pd
dic=dict(JAN='1',FEB='2',MAR='3',APR='4',MAY='5',JUN='6',JUL='7',AUG='8',SEP='9',OCT='10',NOV='11',DEC='12',SPR='3-5',SUM='6-8',AUT='9-11',WIN='12-2')
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        filename="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"a.txt"
        filename1="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"title.txt"
        text=open(filename,'r',encoding="utf-8").read()
        text1=open(filename1,'r',encoding='utf-8').read()
        pat=re.compile('\nPY '+'(.*?)'+'\nVL ',re.S)
        result=pat.findall(text1)#以下是进行去重
       # result1=pat.findall(text1)
        #result1=result1[0].split("\n")
        #for L in range(len( result1)):
                 #result1[L]= result1[L].strip()
        #for L2 in range(len( result1)):
                 #result1[L2]= result1[L2].replace("-","")
        #for l in range(len(result)):
           # result[l]=result[l].split("\n")
            #for l1 in range(len( result[l])):
                 #result[l][l1]= result[l][l1].strip()
            #for l2 in range(len( result[l])):
                # result[l][l2]= result[l][l2].replace("-","").title()
        #result1=pat.findall(text1)
        pd.DataFrame(result).to_csv("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"PY.csv",index=False)
        #pd.DataFrame(result1).T.to_csv("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"AU.csv",index=False)