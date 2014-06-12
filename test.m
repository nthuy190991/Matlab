load mydata.mat kq
t=kq(1,:);
xn=kq(2,:);
N=1001;
n=linspace(0,1000,1001);
T=0.001;
for f=1:500
    P_PER(f)=T/N*(abs(sum(xn.*exp(-i*2*pi*f*T.*n))))^2;
end
f=linspace(1,500,500);
plot(f,P_PER);