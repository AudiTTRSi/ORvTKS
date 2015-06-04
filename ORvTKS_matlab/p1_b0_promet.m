%simulacija TK prometa / paketov

%Osnovni parametri simulacije
st_paketov = 50;
povp_cas = 5;
povp_velikost = 5;

%Generiranje prometa
[dohodni_cas,velikost] = generiraj_prihode(st_paketov,povp_cas,povp_velikost);


%Vizualizacija
narisi_promet(1,dohodni_cas,velikost);