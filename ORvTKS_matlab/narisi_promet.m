function narisi_promet(fig,time,size2)
figure(fig);
clf;
set(gca,'FontSize',16);
string = sprintf('Flow # %g',fig);
title(string);
xlabel('Time slot');
ylabel('Pkt Size');
hold on;

color_vector=['r','b','g','k'];
color=color_vector(fig);

[r,c] = size(time);
num_pkt = c;

for pkt=1:num_pkt
    x1 = time(1,pkt);
    y1 = size2(1,pkt);
    plot([x1,x1],[0 y1],color,'Linewidth',2);
end;