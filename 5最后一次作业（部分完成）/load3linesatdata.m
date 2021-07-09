function satlist=load3linesatdata(filename)%ר�Ŷ�ȡ3�й������
file = fopen(filename,'r');
j = 1;
while feof(file) == 0%����ļ�ĩβ
    %����һ��(��������)
    str = fgetl(file);
    satlist{j,1} = deblank(str);%ɾȥ��β���ַ�
    %���ڶ��У���һ�й�����ݣ�
    str = fgetl(file);
    
    year=str2double(str(19:20));%2000���Ժ��2λ�����
    day=str2double(str(21:32));%����
    if mod(year,4)==0
        satlist{j,2}=2451544.5+year*365+fix(year/4)+day-1;%����JD
    else
        satlist{j,2}=2451544.5+year*365+fix(year/4)+1+day-1;%��ͨ��JD
    end
    %�������У��ڶ��й�����ݣ�
    str = fgetl(file);
    
    satlist{j,3}=str2double(str(9:16))*pi/180;%���i
    satlist{j,4}=str2double(str(18:25))*pi/180;%������ྭomega
    satlist{j,5}=str2double(str(27:33))/10000000;%ƫ����e
    satlist{j,6}=str2double(str(35:42))*pi/180;%���ص㸩��w
    satlist{j,7}=str2double(str(44:51))*pi/180;%ƽ�����M
    satlist{j,8}=str2double(str(53:63));%ƽ���˶�Ȧ��
    satlist{j,9}=str2double(str(64:68));%��Ԫʱ��Ȧ��
    j = j+1;
end
fclose(file);
end