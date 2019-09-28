# -*- coding: utf-8 -*-
"""
Created on Sat Jun 29 12:22:34 2019

@author: wangyangliu
"""

import os
import re
import pandas as pd
A=pd.DataFrame()
A1=pd.DataFrame()
#dic=dict(JAN='1',FEB='2',MAR='3',APR='4',MAY='5',JUN='6',JUL='7',AUG='8',SEP='9',OCT='10',NOV='11',DEC='12',SPR='3-5',SUM='6-8',AUT='9-11',WIN='12-2')
files=os.listdir("D:/北邮文献/北邮")
for i in range(len(files)):
    files1=os.listdir("D:/北邮文献/北邮"+"/"+files[i])
    for j in range(len(files1)):
        filename="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"dt.csv"
        filename1="D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"t.csv"
        a=pd.read_csv(filename)
        a=a.drop(0)
        a1=pd.read_csv(filename1)
        a1=a1.drop(0)
        A=pd.concat([A,a],axis=1)
        A1=pd.concat([A1,a1],axis=1)
        
        
        
    
                          


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                