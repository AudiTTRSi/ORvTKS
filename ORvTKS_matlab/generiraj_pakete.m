function prihod = generiraj_pakete(stanje,TT)

prihod = 0;
x = 0;
u = rand();

for j=1:length(TT)
%     disp(j);
    x = x + TT(stanje, j);
    
    if (x>=u)
        stanje = j;
        break;
    end       
end
prihod = stanje;
