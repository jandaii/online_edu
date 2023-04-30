# -*- coding: utf-8 -*-
"""
Created on Tue Dec  8 14:03:29 2020

@author: HP
"""


def SequencePairMatching(sample,target):
    list_sample = list(sample) 
    list_sample.insert(0,' ') 
    sample = "".join(list_sample) 
 
    list_target = list(target)
    list_target.insert(0,' ')
    target = "".join(list_target)
    
    lens = len(sample)
    lent = len(target)
    opt = [ [0] * lens for i in range(lent)]
    for i in range(lens): 
        opt[0][i] = -3 * i
    for i in range(lent):
        opt[i][0] = -3 * i
    
    for i in range(1,lent): 
        for j in range(1,lens):
            score1 = opt[i-1][j] - 3
            score2 = opt[i][j-1] - 3
            score3 = opt[i-1][j-1] + 1 if target[i] == sample[j] else opt[i-1][j-1] - 1
            opt[i][j] = 0 if max(score1,score2,score3)<0 else max(score1,score2,score3)
            
#     print(opt[lent-1][lens-1])
    return opt[lent-1][lens-1] 