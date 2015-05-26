# -*- coding: utf-8 -*-

# klic z generiraj_promet(izvori, paketi)
# izvori: stevilo izvorov prometa
# paketi: stevilo paketov


def generiraj_promet(izvori, paketi):
    import scipy
    import pylab as P

    n = izvori;   # število izvorov
    s = 1;   # začetno stanje
    packets = paketi; # število paketov

    T = scipy.ones((n,n));  # Matrika prehodov stanj
    T = T / n               # enaka verjetnost vseh izvorov
    print T

    count = scipy.zeros(n, float); #tu štejemo kolikokrat je padla kaka cifra
    data = []; #tu zabeležimo vsak met (za histogram)

    # Nastavimo začetno stanje
    state = s;

    # Izvajamo korake po verigi
    for i in range(1, packets+1):
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

        # return state

        count[state] = count[state] + 1;
        data.append(state+1); #prištejemo 1 ker python stanja šteje od 0 do 5
    print "Kolikokrat je padla posamezna cifra:\n ", count
    print "Preračunana verjetnost:\n" , count *100 / packets 
    n, bins, patches = P.hist(data, 50,  histtype='bar')
    P.grid(True)
    P.show()

    return data