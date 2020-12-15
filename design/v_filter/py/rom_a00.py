#!/usr/bin/env python3

import os
import math

# RGB to YUV Studio swing BT.601
a = [   [66, 129, 25],
        [-38, -74, 112],
        [112, -94, -18]]

# RGB to YCbCr JPG
#a = [   [0.299, 0.587, 0.114],
#        [-0.168736, -0.331264, 0.5],
#        [0.5, -0.418688, -0.081312]]

# YUV to RGB NTSC
b0 = [-16, -128, -128]
b1 = [  [298, 0, 409],
        [298, -100, -208],
        [298, 516, 0]]
b2 = [128, 0, 0]

# YCbCr JPG to RGB
#b0 = [  [1, 0, 1.402],
#        [1, -0.344136, -0.714136],
#        [1, 1.772, 0]]
#b1 = [0, -128, -128]

# YUV to sRGB BT.709
#b0 = [  [1, 0, 1.28033],
#        [1, -0.21482, -0.38059],
#        [1, 2.12798, 0]]
#b1 = [0, -128, -128]

prefix = 'rom_a'
#print(b2)

for y in range (0, 3):
    for x in range (0, 3):
#for y in range (0, 1):
#   for x in range (0, 1):
        filename = prefix+str(y)+str(x)+'.mem'
        print('%s' %filename)
        
        f = open(filename, 'w+')
        
        for i in range (0, 256):
            # YUV BT.601
            temp_int = (a[y][x]*(i<<0))>>(8+0)
            # YCbCr
#            temp_int = int(a[y][x]*i)
            s = (str(hex(temp_int&0x3FF)))[2:]
            print('%d: %d %X %x %s' %(i, temp_int, temp_int, temp_int&0x3FF, s))
            f.write(s)
            f.write('\n')
        
        for j in range (0, 256):
            # YUV NTSC
            temp_int = ((round(b1[y][x]*((j<<0)+b0[x])+b2[x]))>>(8+0))
            # JEGP YCbCr
#            temp_int = round(b0[y][x]*(j+b1[x]))
#            temp_int = math.floor(b0[y][x]*(j+b1[x]))
            # sRGB BT.709
#            temp_int = round(b0[y][x]*j)
#            s = (str(hex(temp_int&0x3FF)))[2:]
            print('%d: %d %X %x %s' %(j, temp_int, temp_int, temp_int&0x3FF, s))
            f.write(s)
            f.write('\n')
        
        f.closed
