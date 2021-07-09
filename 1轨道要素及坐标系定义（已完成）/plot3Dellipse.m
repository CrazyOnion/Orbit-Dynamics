function plot3Dellipse(p,e,omega,w,i)
%¼ÆËãÖ÷Ìå
for f=0:0.01:2*pi

xx=p/(1+e*cos(f))*cos(f);
yy=p/(1+e*cos(f))*sin(f);

r=orbit2earth([xx;yy;0;],omega,w,i);
plot3(r(1),r(2),r(3),'b.','LineWidth',1);hold on;
end

end