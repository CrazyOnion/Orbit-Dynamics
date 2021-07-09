function satlist=load2linesatdata(filename)%专门读取2行轨道数据
file = fopen(filename,'r');
j = 1;
while feof(file) == 0%检测文件末尾
    %读第1行（第一行轨道数据）
    str = fgetl(file);
    
    year=str2double(str(19:20));%2000年以后的年份
    mod(year,4)
    day=str2double(str(21:32));%天数
    if mod(year,4)==0
        satlist{j,2}=2451544.5+year*365+fix(year/4)-1+day;%JD
    else
        satlist{j,2}=2451544.5+year*365+fix(year/4)+day;%JD
    end
    %读第2行（第二行轨道数据）
    str = fgetl(file);
    
    satlist{j,3}=str2double(str(9:16))*pi/180;%倾角i
    satlist{j,4}=str2double(str(18:25))*pi/180;%升交点赤经omega
    satlist{j,5}=str2double(str(27:33))/10000000;%偏心率e
    satlist{j,6}=str2double(str(35:42))*pi/180;%近地点俯角w
    satlist{j,7}=str2double(str(44:51))*pi/180;%平近点角M
    satlist{j,8}=str2double(str(53:63));%平均运动圈数
    satlist{j,9}=str2double(str(64:68));%纪元时刻圈数
    j = j+1;
end
fclose(file);
end