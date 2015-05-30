from generator import generiraj_promet
import scipy

seznam = []

stevilka = 1
for i in range(5):
	for j in range(4):
		seznam.append({'vrsta':i,
			'paket':j, 'stevilka':stevilka})
		stevilka = stevilka + 1

#print seznam
#print len(seznam)
#print type(seznam)
#print seznam[2]['vrsta']

n = 5
s = 1 
T = scipy.ones((n, n))
T = T / n               
#print T

count = scipy.zeros(n, float);
#print count

cin = scipy.zeros((n, n))
#print cin

h = 3
#print h
#print h+h
vrste = generiraj_promet(100,3,[1,2,6,7,12])
print "vrste: ",vrste