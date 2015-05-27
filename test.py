seznam = []

stevilka = 1
for i in range(5):
	for j in range(4):
		seznam.append({'vrsta':i,
			'paket':j, 'stevilka':stevilka})
		stevilka = stevilka + 1

print seznam
print len(seznam)
print type(seznam)
print seznam[2]['vrsta']
