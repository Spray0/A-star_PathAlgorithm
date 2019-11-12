%grid 地图栅格化
fprintf('[INFO]  地图栅格化...\n')
grid_range=10;
grid_p=0.3;

grid_h=fix(map_height/grid_range)+1;
grid_w=fix(map_width/grid_range)+1;


% 画出栅格线
% subplot(1,2,1);
% hold on
% 
% temp=grid_range;
% for i=1:1:grid_w-1
%     plot([temp,temp],[1,map_height],'Color',[0.2 0.2 0.2]);
%     temp=temp+grid_range;
% end
% temp=grid_range;
% for i=1:1:grid_h-1
%     plot([1,map_width],[temp,temp],'Color',[0.2 0.2 0.2]);
%     temp=temp+grid_range;
% end
% 
% clear i;clear temp;
%--------------------------------------------------------------------------
% 栅格数据应该是grid_h*grid_w的数组
% 现在把这个数组给创建出来，还要创建同比例的栅格图
%grid_map=costdata_temp;
tempw=1;temph=1;
for w=1:1:grid_w
    for h=1:1:grid_h
        %对于每个栅格左上角的像素
        z_cnt=0;
        for ah=1:1:grid_range
            for aw=1:1:grid_range 
                if(temph+ah-1>map_height)||(tempw+aw-1>map_width)
                z_cnt=grid_range*grid_range;
                elseif(costdata_temp(temph+ah-1,tempw+aw-1)==0)
                    z_cnt=z_cnt+1;
                end
            end
        end
        if (z_cnt/(grid_range*grid_range))>grid_p
            map(h,w)=0;
        else
            map(h,w)=1;
        end
        temph=temph+grid_range;
    end
    tempw=tempw+grid_range;
    temph=1;
end

for hh=1:1:grid_h
    for ww=1:1:grid_w
        for ffw=1:1:10
            for ffh=1:1:10
                if(ffh+(hh-1)*grid_range<=map_height)&&(ffw+(ww-1)*grid_range<=map_width)
                    grid_map(ffh+(hh-1)*grid_range,ffw+(ww-1)*grid_range)=map(hh,ww);
                end
            end
        end  
    end
end

clear ah;clear aw;clear h;clear w;
clear z_cnt;
clear temph;clear tempw;
subplot(1,2,2);
imshow(grid_map)
%fprintf('[INFO]  地图栅格化完毕\n')

%画出栅格线
subplot(1,2,2);
hold on

temp=grid_range;
for i=1:1:grid_w-1
    plot([temp,temp],[1,map_height],'Color',[0.2 0.2 0.2]);
    temp=temp+grid_range;
end
temp=grid_range;
for i=1:1:grid_h-1
    plot([1,map_width],[temp,temp],'Color',[0.2 0.2 0.2]);
    temp=temp+grid_range;
end

clear i;clear temp;
clear ffh;clear ffw;
clear hh;clear ww;


























