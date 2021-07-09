function [longitude,latitude]=calsatpoint(rarrow,t0,Re,Rp)
% ������
% rarrow���Ĺ���ϵ��earth��λ��ʸ��
% t0��Ԫʱ��
% Re����뾶
% Rp���뾶
% miu������������
rx=rarrow(1);ry=rarrow(2);rz=rarrow(3);r=norm(rarrow);
f=(Re-Rp)/Re;%�������

lamdaearth0=mod((t0-2451545.1)*3600*24*7.292e-5,2*pi);%��J2000��ʼ������0�㾭��ת���ĽǶȣ��ྭ��/rad

%���Ǵ�ʱ�̳ྭ
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
    if(rx>0&&ry>0)%��1����
        lamda=atan(ry/rx);
    end
    if(rx<0&&ry>0)%��2����
        lamda=atan(ry/rx)+pi;
    end
    if(rx<0&&ry<0)%��3����
        lamda=atan(ry/rx)+pi;
    end
    if(rx>0&&ry<0)%��4����
        lamda=atan(ry/rx)+2*pi;
    end
end

%�ྭ�ǲ�����Ƚǲ
deltalamda=abs(lamda-lamdaearth0);
if deltalamda>pi
    deltalamda=2*pi-deltalamda;
end
if (mod(deltalamda+lamdaearth0,2*pi)==lamda)%�Ƕ���
    longitude=deltalamda;
else%������
    longitude=-deltalamda;
end

%����γ��
fai=atan(rz/abs(rx));
%�����γ��latitude(-pi/2~+pi/2),��γΪ������γΪ��
latitude=asin((Re/r)*(f*sin(2*fai)+(f^2)*sin(4*fai)*(Re/r-0.25)))+fai;
%��ͼ
figure(1);

plot(longitude*180/pi, latitude*180/pi,'r.'); hold on;

end