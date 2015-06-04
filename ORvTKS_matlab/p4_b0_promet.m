
% Lastnosti vhodnega prometa (na zaèetku enake za vse)
st_paketov = 50;
povp_cas = 5;
povp_velikost = 5;

% Generiranje paketov
[dohodni_cas,velikost] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
[dohodni_cas2,velikost2] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
[dohodni_cas3,velikost3] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);
[dohodni_cas4,velikost4] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);


% Vizualizacija
narisi_promet(1,dohodni_cas,velikost);
narisi_promet(2,dohodni_cas2,velikost2);
narisi_promet(3,dohodni_cas3,velikost3);
narisi_promet(4,dohodni_cas4,velikost4);


    
        