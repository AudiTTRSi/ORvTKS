# -*- coding: utf-8 -*-

# klic z generiraj_promet(n, stpaketov, velikosti)
# n: stevilo izvorov prometa
# stpaketov: stevilo paketov
# velikosti: stevilo razredov velikosti


import scipy
import pylab as P

def generiraj_promet(n, stpaketov, velikosti):

    n;       # število izvorov
    s = 1;   # začetno stanje
    stpaketov; # število paketov

    T = scipy.ones((n,n));  # Matrika prehodov stanj
    T = T / n               # enaka verjetnost vseh izvorov
    # print T

    count = scipy.zeros(n, float); #tu štejemo kolikokrat je padla kaka cifra
    data = []; #tu zabeležimo vsak met (za histogram)

    # Nastavimo začetno stanje
    state = s;

    # Izvajamo korake po verigi
    for i in range(1, stpaketov+1):
        x = 0;
        u = scipy.random.random(1);
        newState = state;
        for j in range(n):
            x = x + T[state, j];
            # print "\nx: ",x, "j:",j, "state: ",state
            if (x >= u):
                newState = j;
                break;

        state = newState;
        packSize = generiraj_pakete(velikosti)

        # return state

        count[state] = count[state] + 1;
        data.append({'vrsta':(state+1),'velikost':packSize}); #prištejemo 1 ker python stanja šteje od 0 do 5
    # print "Kolikokrat je padla posamezna cifra:\n ", count
    # print "Preračunana verjetnost:\n" , count *100 / stpaketov 
    # n, bins, patches = P.hist(data, 50,  histtype='bar')
    # P.grid(True)
    # P.show()

    return data



def generiraj_pakete(maxVelikost):
    # maxVelikost = 5;   # število razredov velikosti paketov

    # Nastavimo začetno velikost
    velikost = 1;

    T = scipy.ones((maxVelikost,maxVelikost));  # Matrika prehodov stanj
    T = T / maxVelikost               # enaka verjetnost vseh velikosti paketov

    # Izvajamo korake po verigi
    x = 0;
    u = scipy.random.random(1);
    novaVelikost = velikost;
    for j in range(maxVelikost):
        x = x + T[velikost, j];
        # print "\nx: ",x, "j:",j, "velikost: ",velikost
        if (x >= u):
            novaVelikost = j;
            break;

    velikost = novaVelikost;
    # vrnemo velikost paketa klicu funkcije
    return velikost
