

% Lastnosti vhodnega prometa
st_paketov = 50;
povp_cas = 5;
povp_velikost = 5;

% Lastnosti èakalne vrste
output_tick = 5;
buffer_size = 100;
velikost_out_prometa = 10;

[dohodni_cas,velikost] = generiraj_izvore(1,50,[0 1 2 3 4 5 6 7 8 9]);

koncni_cas = max(dohodni_cas)+100;
izhodni_promet = [];
izhodni_cas = [];

buff1 = bufferSim(1,buffer_size);


for k=0:koncni_cas
    
    %praznenje vrst
    if mod(k,output_tick)== 0
        tmp1 = 0;

        cap = velikost_out_prometa;
        [buff1,tmp1]=bufferSim(3,buff1,cap);
      
        izhodni_cas = [izhodni_cas k];
        izhodni_promet = [izhodni_promet nnz(tmp1)];
    end
    
    %polnenje vrst
    ind = find(dohodni_cas == k);
    if ind
        buff1 = bufferSim(2,buff1,velikost(ind));
    end

end

narisi_promet(1,dohodni_cas,velikost);
narisi_promet(4,izhodni_cas,izhodni_promet);
%narisi_izhodni_promet(5,izhodni_cas,izhodni_promet);

    
        