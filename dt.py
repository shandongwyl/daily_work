# -*- coding: utf-8 -*-
"""
Created on Thu Jul 11 21:02:55 2019

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

        aim = ["AF", "DI", "PD", "PY", "TC","EA","EY"]


        all_res = [] 

        for paper in papers :
            res = {key:"" for key in aim}
            lines = paper.split("\n")
    # print(lines[0])
    # print("-------------")
            begin = False
            key = ""
            for line in lines :
                if line[:2] == "  " and key != "" :
                    res[key] += line +""
                elif line[:2] in aim :
                    key = line[:2]
                    res[key] += line[3:] + ""
                else :
                    key = ""

            all_res.append(res)
            b=pd.DataFrame(all_res)
            k=b['PY'].append(b['EY'])
            #k=k.sort_values()
            k1=k.value_counts()
            k2=pd.DataFrame(k1)
            k3=k2.sort_index()
        #pat=re.compile('\nPD '+'(.*?)'+'\nVL ',re.S)
        #result=pat.findall(text)
        '''for k in range(len(result)):
            #dic=dict(JAN=1,FEB=2,MAR=3,APR=4,MAY=5,JUN=6,JUL=7,AUG=8,SEP=9,OCT=10,NOV=11,DEC=12)
            result[k]=result[k].split('\nPY ')
            a=result[k][0]
            if " " in a:
                a=a.split(" ")
                a[0]=dic[a[0]]
                a=a[0]+"/"+a[1]
            elif "-" in a:
                a=a.split("-")
                a[0]=dic[a[0]]
                a[1]=dic[a[1]]
                a=a[0]+"-"+a[1]
            else:
                a=dic[a]
                
            b=result[k][1]
            result[k]=b+"/"+a
         
            #if " " in result[k][1]:
                #result[k][1]="/".join(result[k][1].split(" "))
            #result[k]='/'.join(result[k])'''
        k3.to_csv("D:/北邮文献/北邮"+"/"+files[i]+"/"+files1[j]+"/"+"dt.csv")