%position 

fprintf('[INFO]  左键选择目标终点\n')
title('左键选择目标终点','Color','black');

but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end
xval=fix(xval/grid_range);
yval=fix(yval/grid_range);
xTarget=xval+1;
yTarget=yval+1;

x=xval*grid_range;
y=yval*grid_range;
dp=grid_range/2;
if(map(yTarget,xTarget)==0)
    subplot(1,2,2);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'r');
    error('错误的点');
else
    subplot(1,2,2);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'m');
    subplot(1,2,1);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'m');
    text(x+grid_range+dp,y+dp,'Target','Color','m');
end

subplot(1,2,2);hold on;
fprintf('[INFO]  左键选择起点\n')
title('左键选择起点','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end
xval=fix(xval/grid_range);
yval=fix(yval/grid_range);
xStart=xval+1;
yStart=yval+1;

x=xval*grid_range;
y=yval*grid_range;
dp=grid_range/2;
if(map(yStart,xStart)==0)
    subplot(1,2,2);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'r');
    error('错误的点');
else
    subplot(1,2,2);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'b');
    subplot(1,2,1);hold on;
    fill([x,x+grid_range,x+grid_range,x],[y,y,y+grid_range,y+grid_range],'b');
    text(x+grid_range+dp,y+dp,'Start','Color','b');
end

clear but;
clear x;clear y;
clear xval;clear yval;

subplot(1,2,2);hold on;
title(' ','Color','black');









