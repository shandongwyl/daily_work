# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 13:34:53 2019

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
        #filename = "C:/Users/linzizhan/Desktop/Tungsten disulphide for ultrashort pulse generation in all-fiber lasers.txt"

        with open(filename, "r", encoding="utf-8") as fi :
         data = fi.read()
# print(data[:50])


        papers = data.split("PT J\n")

#print(len(papers), papers[0])
# print(papers[0], end="\n---------------\n")

        papers = papers[1:]
# print(papers[0])
# print("-------------")
        possible_head = []

        aim = [ "AF","DI", "PD", "PY", "TC","EA","EY"]


        all_res = [] 

        for paper in papers :
            res = {key:"" for key in aim}
            lines = paper.split("\n")
            begin = False
            key = ""
            for line in lines :
                if line[:2] == "  " and key != "" :
                    res[key] += line +""
                elif line[:2] in aim :
                    key = line[:2]
                    res[key] += line[3:] + "|"
                else :
                    key = ""

            all_res.append(res)
            b=pd.DataFrame(all_res)
          #  di=b['DI']
            #for h in range(len(di)):
                '''di[h]=di[h].split("|")[0]
        
        for i1 in range(len(b)):
            for i2 in range(i1+1,len(b)):
             c=b['AF'][i1].split('|')
             d=b['AF'][i2].split('|')
             for i2 in c:
                 if "" in c:
                    c.remove("")
             for i2 in c:
                if "" in c:
                    c.remove("")
            for j1 in c:
                for j2 in d:
                    if j1==j2:'''
                    
                