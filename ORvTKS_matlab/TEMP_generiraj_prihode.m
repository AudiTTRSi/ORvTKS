% generiraj_prihode(n,stPaketov,velikostiPaketov)


% n je stevilo izvorov, integer
% stPaketov, integer
% velikostiPaketov, 1D array

% function [dohodni_cas,velikost] = generiraj_prihode(n,stPaketov,velikostiPaketov)
function data = generiraj_prihode(n,stPaketov,velikostiPaketov)

T = ones(n, n); % matrika prehodov stanj, 2D array
T = T./n; % enaka verjetnost vseh izvorov, deljenje vseh elementov

TT = ones(length(velikostiPaketov),length(velikostiPaketov));
TT = TT./length(velikostiPaketov);

stanjaPaketov = ones(n);

data = []; % matrika za return
stanje = 1; % zacetno stanje

for i=1:stPaketov % izvajamo korake po verigi
    x = 0;
    u = rand(); % vrne random od 0 do 1

    for j=1:n
        %print "Vrednost x je", x, "| Vrednost v matriki prehodov je", T[stanje, j]
        x = x + T(stanje, j);

        %print "Zdaj je x =", x, "ob iteraciji j =", j, "| Random vrne", u, "| stanje:", stanje
        if (x >= u)
            %print "Breakam ven"
            stanje = j;
            break;
        end
        % print "Konec iteracije\n"
    end

        
    paket = generiraj_pakete(stanjaPaketov(stanje), TT);
    stanjaPaketov(stanje) = paket;
    paket = velikostiPaketov(paket);

    % print "Dopisujem novo\n"
    data = [data; [i, stanje, paket]];	% append
    dohodni_cas = i;
    velikost = paket;
end
