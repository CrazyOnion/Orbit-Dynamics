function plot3Dellipse(p,e,omega,w,i)
%¼ÆËãÖ÷Ìå
for f=0:0.01:2*pi
rr=p/(1+e*cos(f));
xx=rr*cos(f);
yy=rr*sin(f);
r=orbit2earth([xx;yy;0;],omega,w,i);

plot3(r(1),r(2),r(3),'b.');hold on;
end

end