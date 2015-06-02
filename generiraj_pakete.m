function paket = generiraj_pakete(stanje,TT)

x = 0;
u = rand();

for j=0:length(TT)
    x = x + TT(state, j);
    if (x >= u)
        state = j;
        break;
