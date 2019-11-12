% »æÖÆÂ·¾¶

for j=Optimal_path_steps-1:-1:2
    y=(Optimal_path(j,1)-1)*grid_range;
    x=(Optimal_path(j,2)-1)*grid_range;
    
    yl=(Optimal_path(j+1,1)-1)*grid_range;
    xl=(Optimal_path(j+1,2)-1)*grid_range;
    
    subplot(1,2,2);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],[0.66 0.66 1]);
    
    subplot(1,2,1);hold on;
    plot([x+dp,xl+dp],[y+dp,yl+dp],'Color',[0.66 0.66 1],'LineWidth',3);
end
y=(Optimal_path(1,1)-1)*grid_range;
x=(Optimal_path(1,2)-1)*grid_range;
plot([x+dp,xl+dp],[y+dp,yl+dp],'Color',[0.66 0.66 1],'LineWidth',3);