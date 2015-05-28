#fajl  p4_b4_RR.mm preveden v python

#Lastnosti vh.prometa
st_paketov = 50
povp_cas = 5
povp_velikost = 5

#lastnosti izh. prometa
output_tick = 5
velikost_izh_prometa = 20

#lastnosti medpomnilnika
buffer_size = 100

[dohodni_cas,velikost] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);

[dohodni_cas2,velikost2] = generiraj_prihode(st_paketov,povp_cas,povp_velikost)
[dohodni_cas3,velikost3] = generiraj_prihode(st_paketov,povp_cas,povp_velikost)

koncni_cas = max(dohodni_cas) + 100
izhodnih_promet = []
izhodni_cas = []

buff1 = bufferSim(1,buffer_size);
buff2 = bufferSim(1,buffer_size);
buff3 = bufferSim(1,buffer_size);


#pomoč for x in xrange(1, 11):
for k in range(0: koncni_cas)
	
	#praznenje vrst
	if k % output_tick == 0
		tmp1 = 0
		tmp2 = 0
		tmp3 = 0
		if stevec % 4 == 0
			[buff1,tmp1]=bufferSim(3,buff1,velikost_out_prometa)
		elif stevec % 3 = 0
			[buff2,tmp2]=bufferSim(3,buff2,velikost_out_prometa)
		elif stevec % 2 = 0
			[buff3,tmp3]=bufferSim(3,buff3,velikost_out_prometa)
		else
			[buff4,tmp4]=bufferSim(3,buff4,velikost_out_prometa)
		stevec = stevec +1;
        izhodni_cas = [izhodni_cas k];
        izhodni_promet = [izhodni_promet [nnz(tmp1);nnz(tmp2);nnz(tmp3);nnz(tmp4)]];

	#polnenje vrst
	ind = find(dohodni_cas == k) #treba ugotovit ka je najbolj uporaben substitud matlab funckije find
	if ind
		buff1 = bufferSim(2,buff1,velikost(ind))
	ind = find(dohodni_cas2 == k)
	if ind
		buff2 = bufferSim(2,buff2,velikost2(ind))
	ind = find(dohodni_cas3 == k);
	if ind 		
		buff3 = bufferSim(2,buff3,velikost3(ind))
	ind = find(dohodni_cas4 == k)
	if ind
        buff4 = bufferSim(2,buff4,velikost4(ind))

narisi_promet(1,dohodni_cas,velikost);
narisi_promet(2,dohodni_cas2,velikost2);
narisi_promet(3,dohodni_cas3,velikost3);
narisi_promet(4,dohodni_cas4,velikost4);
narisi_izhodni_promet(5,izhodni_cas,izhodni_promet);
