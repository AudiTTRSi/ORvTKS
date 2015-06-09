clear all;
close all;
clc;

st_paketov = 100;
povp_cas = 10;
povp_velikost = 100;

[dohodni_cas,velikost] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);

narisi_promet(1,dohodni_cas,velikost);