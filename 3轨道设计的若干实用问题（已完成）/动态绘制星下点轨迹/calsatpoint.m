function [longitude,latitude]=calsatpoint(rarrow,t0,Re,Rp)
% 参数表
% rarrow地心惯性系（earth）位置矢量
% t0纪元时刻
% Re赤道半径
% Rp极半径
% miu引力质量常数
rx=rarrow(1);ry=rarrow(2);rz=rarrow(3);r=norm(rarrow);
f=(Re-Rp)/Re;%地球扁率

lamdaearth0=mod((t0-2451545.1)*3600*24*7.292e-5,2*pi);%自J2000起始，地球0°经线转过的角度（赤经）/rad

%卫星此时刻赤经
if(rx==0)
    if(ry>0)
        lamda=pi/2;
    else
        lamda=3*pi/2;
    end
elseif(ry==0)
    if(rx>0)
        lamda=0;
    else
        lamda=pi;
    end
end
if(rx~=0&&ry~=0)
    if(rx>0&&ry>0)%第1象限
        lamda=atan(ry/rx);
    end
    if(rx<0&&ry>0)%第2象限
        lamda=atan(ry/rx)+pi;
    end
    if(rx<0&&ry<0)%第3象限
        lamda=atan(ry/rx)+pi;
    end
    if(rx>0&&ry<0)%第4象限
        lamda=atan(ry/rx)+2*pi;
    end
end

%赤经角差（即经度角差）
deltalamda=abs(lamda-lamdaearth0);
if deltalamda>pi
    deltalamda=2*pi-deltalamda;
end
if (mod(deltalamda+lamdaearth0,2*pi)==lamda)%是东经
    longitude=deltalamda;
else%是西经
    longitude=-deltalamda;
end

%地心纬度
fai=atan(rz/abs(rx));
%求地理纬度latitude(-pi/2~+pi/2),北纬为正，南纬为负
latitude=asin((Re/r)*(f*sin(2*fai)+(f^2)*sin(4*fai)*(Re/r-0.25)))+fai;
%绘图
figure(1);

plot(longitude*180/pi, latitude*180/pi,'r.'); hold on;

end