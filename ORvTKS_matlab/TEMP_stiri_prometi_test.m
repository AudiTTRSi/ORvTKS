clear all;
close all;
clc;

st_paketov = 100;
povp_cas = 10;
povp_velikost = 10;

dohodi_cas = zeros(4,st_paketov);
velikost = zeros(4,st_paketov);

for flow = 1:4
    [dohodni_cas(flow,:),velikost(flow,:)] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
    narisi_promet(flow,dohodni_cas(flow,:),velikost(flow,:));
end

narisi_vse(5,dohodni_cas,velikost);