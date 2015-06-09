% Lastnosti vhodnega prometa
st_paketov = 50;
povp_cas = 5;
povp_velikost = 5;

%Lastnosti izhodnega kanala
output_tick = 5;
velikost_out_prometa = 20;

%Lastnosti medpomnilnika - vrste
buffer_size = 100;

[dohodni_cas,velikost] = generiraj_izvore(4,10,[1 2 6]);

dohodni_cas1 = dohodni_cas;

dohodni_cas2 = dohodni_cas(2,:);
dohodni_cas3 = dohodni_cas(3,:);
dohodni_cas4 = dohodni_cas(4,:);
dohodni_cas = dohodni_cas(1,:);

velikost1 = velikost;
velikost2 = velikost(2,:);
velikost3 = velikost(3,:);
velikost4 = velikost(4,:);
velikost = velikost(1,:);

% [dohodni_cas,velikost] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
% [dohodni_cas2,velikost2] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
% [dohodni_cas3,velikost3] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
% [dohodni_cas4,velikost4] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);

koncni_cas = max(dohodni_cas)+100;
izhodni_promet = [];
izhodni_cas = [];

buff1 = bufferSim(1,buffer_size);
buff2 = bufferSim(1,buffer_size);
buff3 = bufferSim(1,buffer_size);
buff4 = bufferSim(1,buffer_size);


for k=0:koncni_cas
    
    %praznenje vrst
    if mod(k,output_tick)== 0
        tmp1 = 0;
        tmp2 = 0;
        tmp3 = 0;
        tmp4 = 0;
        cap = velikost_out_prometa;
        [buff1,tmp1]=bufferSim(3,buff1,cap);
        cap = cap - nnz(tmp1);
        if(cap > 0)
            [buff2,tmp2]=bufferSim(3,buff2,cap);
            cap = cap - nnz(tmp2);
        end
        if(cap > 0)
            [buff3,tmp3]=bufferSim(3,buff3,cap);
            cap = cap - nnz(tmp3);
        end
        if(cap > 0)
            [buff4,tmp4]=bufferSim(3,buff4,cap);
            cap = cap - nnz(tmp4);
        end        
        izhodni_cas = [izhodni_cas k];
        izhodni_promet = [izhodni_promet [nnz(tmp1);nnz(tmp2);nnz(tmp3);nnz(tmp4)]];
    end
    
    %polnenje vrst
    ind = find(dohodni_cas == k);
    if ind
        buff1 = bufferSim(2,buff1,velikost(ind));
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

narisi_promet(1,dohodni_cas,velikost);
narisi_promet(2,dohodni_cas2,velikost2);
narisi_promet(3,dohodni_cas3,velikost3);
narisi_promet(4,dohodni_cas4,velikost4);
narisi_izhodni_promet(5,izhodni_cas,izhodni_promet);

    
        