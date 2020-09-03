#!/usr/bin/env python3

import os
import math

a = [	[66, 129, 25],
		[-38, -74, 112],
		[112, -94, -18]]
b0 = [-16, -128, -128]
b1 = [	[298, 0, 409],
		[298, -100, -208],
		[298, 516, 0]]
b2 = [128, 0, 0]

prefix = 'rom_a'
print(b2)

for y in range (0, 3):
	for x in range (0, 3):
#for y in range (0, 1):
#	for x in range (0, 1):
		filename = prefix+str(y)+str(x)+'.mem'
		print('%s' %filename)
		
		f = open(filename, 'w+')
		
		for i in range (0, 256):
			temp_int = (a[y][x]*(i<<0))>>(8+0)
			s = (str(hex(temp_int&0x3FF)))[2:]
			print('%d: %d %X %x %s' %(i, temp_int, temp_int, temp_int&0x3FF, s))
			f.write(s)
			f.write('\n')
		
		for j in range (0, 256):
			temp_int = ((round(b1[y][x]*((j<<0)+b0[x])+b2[x]))>>(8+0))
			s = (str(hex(temp_int&0x3FF)))[2:]
			print('%d: %d %X %x %s' %(j, temp_int, temp_int, temp_int&0x3FF, s))
			f.write(s)
			f.write('\n')
		
		f.closed
