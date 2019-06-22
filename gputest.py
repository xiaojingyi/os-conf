#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: 2015 Jingyi Xiao
# FileName: gputest.py
# Date: 2015 2015年05月25日 星期一 21时04分18秒
# Encoding: utf-8
# Author: Jingyi Xiao <kxwarning@126.com>
# Note: This source file is NOT a freeware

__author__="Jingyi"

import os, sys, time
os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'

#!/usr/bin/python

import gnumpy
import numpy
from time import time

ox=[range(1000) for x in range(1000)]
oy=[range(1000) for y in range(1000)]

m=gnumpy.garray(ox)
n=gnumpy.garray(oy)

p=numpy.array(ox)
q=numpy.array(oy)

print ox.shape()
print oy.shape()
print "start testing..."
def run_gnumpy(a,b):
    st_g = time()
    len_a = gnumpy.dot(a,a)
    len_b = gnumpy.dot(b,b)
    res = gnumpy.dot(a, b) / (len_a * len_b)
    et_g = time()
    print res
    return et_g-st_g

def run_numpy(a,b):
    st_n = time()
    len_a = numpy.dot(a,a)
    len_b = numpy.dot(b,b)
    res = numpy.dot(a, b) / (len_a * len_b)
    et_n = time()
    print res
    return et_n-st_n

print (str(run_numpy(p,q)/run_gnumpy(m,n)))

# Modeline for ViM {{{
# vim:set ts=4:
# vim600:fdm=marker fdl=0 fdc=3:
# }}}

