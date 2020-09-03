#!/usr/bin/env python3

import os
import math
		# +1   0  -1
gx = [	[  1,  0, -1],	# +1
		[  2,  0, -2],	#  0
		[  1,  0, -1]]	# -1
gy = [	[  1,  2,  1],	# +1
		[  0,  0,  0],	#  0
		[ -1, -2, -1]]	# -1
			# +1    0   -1
y_pixel = [	[  76, 149,  29],# +1
			[   0, 255, 128],#  0
			[ 225, 105, 178]]# -1

gxs = 0
gys = 0

for y in range (0, 3):
	for x in range (0, 3):
		print('pixel[%d][%d] = %d gx[%d][%d] = %d gy[%d][%d] = %d' %(y, x, y_pixel[y][x], y, x, gx[y][x], y, x, gy[y][x]))
		
		temp = y_pixel[y][x] * gx[y][x]
		print(temp)
		gxs = gxs + temp;
		
		temp = y_pixel[y][x] * gy[y][x]
		print(temp)
		gys = gys + temp

temp = abs(gxs)
print('abs(gxs) = %d' %(temp))
g = temp

temp = abs(gys)
print('abs(gys) = %d' %(temp))
g = g + temp

print('g = %d' %(g))

if (g < 255):
	g = 255 - g % 256
else:
	g = 0

print('g = %d' %(g))
