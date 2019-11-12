% 读取地图数组  用于处理思岚m2m1地图数据

%--------------------------------------------------------------------------
% 获取地图尺寸，还有map索引
%--------------------------------------------------------------------------
fprintf('[INFO]  原始地图数据加载...\n')
raw_stcm=load('full_map_data_raw.txt');  %full_map_data_raw.txt
total_num_temp=size(raw_stcm(1,:));
total_num=total_num_temp(1,2);

str_dimension_height=[100, 105, 109, 101, 110, 115, 105, 111, 110, 95, 104, 101, 105, 103, 104, 116];
total_num_temp=size(str_dimension_height);
str_dimension_height_num=total_num_temp(1,2);
str_dimension_width =[100, 105, 109, 101, 110, 115, 105, 111, 110, 95, 119, 105, 100, 116, 104];
total_num_temp=size(str_dimension_width);
str_dimension_width_num=total_num_temp(1,2);
str_explore=[101, 120, 112, 108, 111, 114, 101];
total_num_temp=size(str_explore);
str_explore_num=total_num_temp(1,2);
clear total_num_temp;

raw_data_cnt=1;
para_flag=0;
check=[];
get_flag=[0,0,0];

while(para_flag==0)
    raw_data_cnt=raw_data_cnt+1;
    if (raw_stcm(1,raw_data_cnt)==str_dimension_height(1,1))&&(get_flag(1,1)==0)
        for i=1:1:str_dimension_height_num
            check(1,i)=raw_stcm(1,raw_data_cnt+i-1);
        end
        if(isequal(check,str_dimension_height))
            if(raw_stcm(1,raw_data_cnt+str_dimension_height_num)<48)&&(raw_stcm(1,raw_data_cnt+str_dimension_height_num+1)<48)                
                str_dimension_height_index=raw_data_cnt+str_dimension_height_num+2;
                %已经得到位置
                dh_cnt=1;
                while(raw_stcm(1,str_dimension_height_index)>47)
                    dimension_height_save(1,dh_cnt)=raw_stcm(1,str_dimension_height_index);
                    str_dimension_height_index=str_dimension_height_index+1;
                    dh_cnt=dh_cnt+1;
                end
                get_flag(1,1)=1;
                %高度存储完毕
            end
        end
    end
    if (raw_stcm(1,raw_data_cnt)==str_dimension_width(1,1))&&(get_flag(1,2)==0)
        for i=1:1:str_dimension_width_num
            check2(1,i)=raw_stcm(1,raw_data_cnt+i-1);
        end
        if(isequal(check2,str_dimension_width))
            if(raw_stcm(1,raw_data_cnt+str_dimension_width_num)<48)&&(raw_stcm(1,raw_data_cnt+str_dimension_width_num+1)<48)
                str_dimension_width_index=raw_data_cnt+str_dimension_width_num+2;
                %已经得到位置
                dw_cnt=1;
                while(raw_stcm(1,str_dimension_width_index)>47)
                    dimension_width_save(1,dw_cnt)=raw_stcm(1,str_dimension_width_index);
                    str_dimension_width_index=str_dimension_width_index+1;
                    dw_cnt=dw_cnt+1;
                end
                get_flag(1,2)=1;
                %宽度存储完毕
            end
        end
    end
    if (raw_stcm(1,raw_data_cnt)==str_explore(1,1))&&(get_flag(1,3)==0)
        for i=1:1:str_explore_num
            check3(1,i)=raw_stcm(1,raw_data_cnt+i-1);
        end
        if(isequal(check3,str_explore))
            map_index=raw_data_cnt+str_explore_num;
            get_flag(1,3)=1;
        end
    end
    %全部获取完毕
    if(get_flag(1,1)==1)&&(get_flag(1,2)==1)&&(get_flag(1,3)==1)
        para_flag=1;%exit
        clear str_dimension_height_index;
        clear str_dimension_width_index;
        clear str_dimension_height;
        clear str_dimension_width;
        clear str_dimension_height_num;
        clear str_dimension_width_num;
        clear str_explore;
        clear str_explore_num;
        clear i;
        clear dh_cnt;
        clear dw_cnt;
        clear check;
        clear check2;
        clear check3;
    end
    %未找到！
    if(raw_data_cnt==total_num-100)
        error('size none found!');
    end
end
clear get_flag;
clear para_flag;
clear raw_data_cnt;


%--------------------------------------------------------------------------
% 把长宽数据解析出来
%--------------------------------------------------------------------------
temp=size(dimension_height_save);
sh=temp(1,2);
temp=size(dimension_width_save);
wh=temp(1,2);
map_height=0;
map_width=0;
for i=1:1:sh
    map_height=map_height+(dimension_height_save(1,i)-48)*10^(sh-i);
end
for i=1:1:wh
    map_width=map_width+(dimension_width_save(1,i)-48)*10^(wh-i);
end
clear i;
clear dimension_height_save;
clear dimension_width_save;
clear temp;
clear sh;
clear wh;


%--------------------------------------------------------------------------
% 创建地图数组
%--------------------------------------------------------------------------
cnt=map_index;
for l=1:1:map_height
    for i=1:1:map_width   
        map_data(l,i)=raw_stcm(1,cnt);
        cnt=cnt+1;
    end
end
clear i;
clear l;
clear cnt;
clear map_index;
clear total_num;
clear raw_stcm;

%map_data2=map_data;
%--------------------------------------------------------------------------
% 地图左右翻转
%--------------------------------------------------------------------------
map_temp=map_data;
for l=1:1:map_height
    for i=1:1:map_width   
        map_data(l,i)=map_temp(l,map_width+1-i);
    end
end
clear i;
clear l;
clear map_temp;


fprintf('[INFO]  加载地图完毕  长:%d  宽:%d\n',map_height,map_width);































