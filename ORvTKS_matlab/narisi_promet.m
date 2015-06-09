function narisi_promet(fig,time,size2)
figure(fig);
clf;
set(gca,'FontSize',16);
string = sprintf('Tok %g',fig);
title(string);
xlabel('Casovna rezina');
ylabel('Velikost paketov');
hold on;

color_vector=['r','g','b','k'];
color=color_vector(fig);

[r,c] = size(time);
num_pkt = c;

for pkt=1:num_pkt
    x1 = time(1,pkt);
    y1 = size2(1,pkt);
    plot([x1,x1],[0 y1],color,'Linewidth',2);
end;