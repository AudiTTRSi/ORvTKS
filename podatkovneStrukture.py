# python simulacija vrste in sklada
import numpy as np


def vrstaPush( vrsta, podatek ):
    prosta_mesta = [i for i,x in enumerate(vrsta) if x == 99];
    if len(prosta_mesta) > 0:
        vrsta = np.insert(vrsta,prosta_mesta[len(prosta_mesta)-1]+1,podatek);
        vrsta = np.delete(vrsta,0);
        status = 1; #vnos je bil uspesen
    else:
       status = 0;  #vnos ni bil uspesen
    return [vrsta,status]


def vrstaPop( vrsta ):
    velikost = len(vrsta);
    podatek = 99; 
    podatek = vrsta[velikost-1];
    vrsta = np.insert(vrsta,0,99);
    vrsta = np.delete(vrsta,velikost);
    prosta_mesta = [i for i,x in enumerate(vrsta) if x == 99];     
   
    if len(prosta_mesta)==velikost:
        status = 0; #vrsta je prazna
    else:
        status = 1; #v vrsti se se nahajajo podatki
    return [vrsta,status,podatek]

def skladPush( sklad, podatek ):
    prosta_mesta = [i for i,x in enumerate(sklad) if x == 99];
    if len(prosta_mesta) > 0:
        sklad = np.append(sklad,podatek);
        sklad = np.delete(sklad,0);
        status = 1; # vnos je bil uspesen
    else:
       status = 0;  #vnos ni uspel
    return [sklad,status]


def skladPop( sklad ):
    velikost = len(sklad);
    podatek = 99; 
    podatek = sklad[velikost-1];
    sklad = np.insert(sklad,0,99);
    sklad = np.delete(sklad,velikost);
    prosta_mesta = [i for i,x in enumerate(sklad) if x == 99];     
   
    if len(prosta_mesta)==velikost:
        status = 0; # sklad je prazen
    else:
        status = 1; #c skladu so se podatki
    return [sklad,status,podatek]
