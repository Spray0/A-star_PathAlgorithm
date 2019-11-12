%cost map make

cost_val=5;
fprintf('[INFO]  安全区域加载...\n')

costdata_temp=map_data;
for h=1:1:map_height
    for w=1:1:map_width
        if(map_data(h,w)==0)
            %这个点周围需要填充
            for hh=-cost_val:cost_val
                for ww=-cost_val:cost_val
                    if(hh+h>1)&&(ww+w>1)&&(hh+h<=map_height)&&(ww+w<=map_width)
                        %这个点在区间内，可以填充
                        costdata_temp(h+hh,w+ww)=0;
                    end
                end
            end
        end
    end
end
clear h;
clear hh;
clear w;
clear ww;


subplot(1,2,1);
imshow(map_data);
hold on
imshow(costdata_temp);
alpha(0.5)
%fprintf('[INFO]  安全区域加载完毕\n')