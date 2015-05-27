# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np

seznam = []

stevilka = 1
for i in range(5):
	for j in range(8):
		seznam.append({'vrsta':i,
			'paket':j, 'stevilka':stevilka})
		stevilka = stevilka + 1
y0 = np.zeros((len(seznam),), dtype=np.int)
y1 = np.zeros((len(seznam),), dtype=np.int)
y2 = np.zeros((len(seznam),), dtype=np.int)

x = range(0,len(seznam))


# print type(seznam)
print "\n"
# print seznam['vrsta']
for i in range(len(seznam)):
	if seznam[i]['vrsta']==0:
		y0[seznam[i]['stevilka']] = seznam[i]['paket']
	if seznam[i]['vrsta']==1:
		y1[seznam[i]['stevilka']] = seznam[i]['paket']
		# print "|| i2 =",i,"|| y1 =",y1[i],"y2 =",y2[i], "|| vrsta =",seznam[i]['vrsta']
	if seznam[i]['vrsta']==2:
		y2[seznam[i]['stevilka']] = seznam[i]['paket']
		# print "|| i2 =",i,"|| y1 =",y1[i],"y2 =",y2[i], "|| vrsta =",seznam[i]['vrsta']

plt.figure(1)
# plt.stem(x,y1,facecolor='r-')
# plt.stem(x,y2,facecolor='b-')
plt.vlines(x,0,y0,color='k')
plt.vlines(x,0,y1,color='b')
plt.vlines(x,0,y2,color='r')
plt.show();