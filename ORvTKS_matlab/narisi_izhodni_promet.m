function narisi_izhodni_promet(fig,time,input_data,naslov)
figure(fig);
clf;
set(gca,'FontSize',16);
% string = sprintf('Tok %g',fig);
title(naslov);
xlabel('Casovna rezina');
ylabel('Velikost paketov');
hold on;

color_v=['r','g','b','k'];


[r,c] = size(time);
num_pkt = c;

for pkt=1:num_pkt
    x1 = time(1,pkt);
    y1 = input_data(1,pkt);
    y2 = input_data(2,pkt);
    y3 = input_data(3,pkt);
    y4 = input_data(4,pkt);    
    plot([x1,x1],[0 y1],color_v(1),'Linewidth',2);
    plot([x1,x1],[y1 y1+y2],color_v(2),'Linewidth',2);
    plot([x1,x1],[y1+y2 y1+y2+y3],color_v(3),'Linewidth',2);
    plot([x1,x1],[y1+y2+y3 y1+y2+y3+y4],color_v(4),'Linewidth',2);
end;