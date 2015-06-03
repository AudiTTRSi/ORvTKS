function narisi_vse(fig,dohodni,velikost)

figure(fig);
clf;
set(gca,'fontSize',16);
title(sprintf('All Flows'));
xlabel('Time Slot');
ylabel('Pkt Size');
hold on;

color_vector=['r','b','g','k'];
[rows,cols] = size(dohodni);
num_pkt = cols;

for flow=1:rows
    color=color_vector(flow);
    for pkt=1:num_pkt
        x1=dohodni(flow,pkt);
        y1=velikost(flow,pkt);
        nx1 = x1 + (1/4)*(flow-1);
        plot([nx1,nx1],[0,y1],color,'Linewidth',2);
        hold on;
    end
    pause;
end