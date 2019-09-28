# -*- coding: utf-8 -*-
"""
Created on Sun Jun 30 14:54:43 2019

@author: wangyangliu
"""
import re
text=open('D:/北邮文献/physics/10.1103PhysRevLett.119.251304.211/a.txt','r',encoding='utf-8').read()
pat=re.compile('AF '+'(.*?)'+'TI',re.S)
result=pat.findall(text)


