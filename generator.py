# -*- coding: utf-8 -*-

import scipy
import pylab as P

def generiraj_promet(stPaketov, n, velikostiPaketov):

    # n je stevilo izvorov, integer
    # stPaketov, integer
    # velikostiPaketov, 1D array

    T = scipy.ones((n, n)) # matrika prehodov stanj, 2D array
    T = T / n # enaka verjetnost vseh izvorov, matricno deljenje

    TT = scipy.ones((len(velikostiPaketov), len(velikostiPaketov)))
    TT = TT / len(velikostiPaketov)

    stanjaPaketov = scipy.ones(n)

    data = [] # matrika za return
    state = 1 # zacetno stanje

    for i in range(stPaketov): # izvajamo korake po verigi

        x = 0
        u = scipy.random.random(1) # vrne random od 0 do 1

        for j in range(n):

            #print "Vrednost x je", x, "| Vrednost v matriki prehodov je", T[state, j]

            x = x + T[state, j]

            #print "Zdaj je x =", x, "ob iteraciji j =", j, "| Random vrne", u, "| state:", state
            if (x >= u):
                #print "Breakam ven"
                state = j
                break;
            # print "Konec iteracije\n"

        paket = generiraj_paket(stanjaPaketov[state], TT)
        paket = velikostiPaketov[paket]

        # print "Dopisujem novo\n"
        data.append({'indeks' : i+1, 'buffer' : state+1, 'velikost v kB' : paket}); #prištejemo 1 ker python stanja šteje od 0 do 5

    return data



def generiraj_paket(state, TT):
    x = 0;
    u = scipy.random.random(1);

    for j in range(len(TT)):
        x = x + TT[state, j];
        if (x >= u):
            state = j;
            break;
    return state
