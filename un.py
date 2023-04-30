# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 13:36:06 2020
# -*- coding: utf-8 -*-
@author: HP
"""
import jieba
import A
import sys

a=sys.argv[1]
b=sys.argv[2]

def SentencesSimilar(s1,s2): 
    s1 = list(jieba.cut(s1, cut_all=False)) 
    s2 = list(jieba.cut(s2, cut_all=False))
    len1 = len(s1)
    len2 = len(s2)
    
    MS = [ [0] * len2 for i in range(len1) ]
    for i in range(len1):
        for j in range(len2):
            MS[i][j] = A.SequencePairMatching(s1[i],s2[j]) 
    maxMS = [] 
    while True:
        loc = (0,0,0) 
        for j in range(len2):
           if MS[i][j] > loc[2]:
                    loc = (i,j,MS[i][j])
        if loc[2] != 0: 
            maxMS.append(loc)
            for i in range(len1): 
                MS[i][loc[1]] = 0
            for i in range(len2):
                MS[loc[0]][i] = 0
        else:
            break
            

    sumpoint = 0
    for i in range(len(maxMS)):
        sumpoint += maxMS[i][2]
        

    return round(sumpoint/len(a),2)
 



print(SentencesSimilar(a,b))
