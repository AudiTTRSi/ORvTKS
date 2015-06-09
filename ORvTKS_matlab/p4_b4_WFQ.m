% Lastnosti vhodnega prometa
stIzvorov = 4;
stPaketov = 500;
velikosti_paketov = [1 2 4 8 16];


%Lastnosti izhodnega kanala
output_tick = 5;
velikost_out_prometa = 20;

%Lastnosti medpomnilnika - vrste
buffer_size = 100;

[dohodni_cas,velikost] = generiraj_izvore(stIzvorov, stPaketov, velikosti_paketov);



dohodni_cas1 = dohodni_cas(1,:);
dohodni_cas2 = dohodni_cas(2,:);
dohodni_cas3 = dohodni_cas(3,:);
dohodni_cas4 = dohodni_cas(4,:);


velikost1 = velikost(1,:);
velikost2 = velikost(2,:);
velikost3 = velikost(3,:);
velikost4 = velikost(4,:);

koncni_cas = max(dohodni_cas1)+100;
izhodni_promet = [];
izhodni_cas = [];

buff1 = bufferSim(1,buffer_size);
buff2 = bufferSim(1,buffer_size);
buff3 = bufferSim(1,buffer_size);
buff4 = bufferSim(1,buffer_size);

stevec = 1;

kapaciteta_vhoda = floor(mean(velikost1) + mean(velikost2) + mean(velikost3) + mean(velikost4));
rate1 = floor(velikost_out_prometa*mean(velikost1)/kapaciteta_vhoda);
rate2 = floor(velikost_out_prometa*mean(velikost2)/kapaciteta_vhoda);
rate3 = floor(velikost_out_prometa*mean(velikost3)/kapaciteta_vhoda);
rate4 = velikost_out_prometa - rate1 - rate2 - rate3;


for k=0:koncni_cas
    
    %praznenje vrst
    
    if mod(k,output_tick)== 0
        tmp1 = 0;
        tmp2 = 0;
        tmp3 = 0;
        tmp4 = 0;
        
        [buff1,tmp1]=bufferSim(3,buff1,rate1);      
        [buff2,tmp2]=bufferSim(3,buff2,rate2);
        [buff3,tmp3]=bufferSim(3,buff3,rate3);        
        [buff4,tmp4]=bufferSim(3,buff4,rate4);

        stevec = stevec +1;
        izhodni_cas = [izhodni_cas k];
        izhodni_promet = [izhodni_promet [nnz(tmp1);nnz(tmp2);nnz(tmp3);nnz(tmp4)]];
    end
    
    %polnenje vrst
    ind = find(dohodni_cas1 == k);
    if ind
        buff1 = bufferSim(2,buff1,velikost1(ind));
    end
    ind = find(dohodni_cas2 == k);
    if ind
        buff2 = bufferSim(2,buff2,velikost2(ind));
    end
    ind = find(dohodni_cas3 == k);
    if ind
        buff3 = bufferSim(2,buff3,velikost3(ind));
    end
    ind = find(dohodni_cas4 == k);
    if ind
        buff4 = bufferSim(2,buff4,velikost4(ind));
    end
end

narisi_promet(1,dohodni_cas1,velikost1);
narisi_promet(2,dohodni_cas2,velikost2);
narisi_promet(3,dohodni_cas3,velikost3);
narisi_promet(4,dohodni_cas4,velikost4);
narisi_izhodni_promet(5,izhodni_cas,izhodni_promet,'Weighted Fair Queue');

    
        