load mydata.mat kq
t=kq(1,:);
xn=kq(2,:);
N1=0;
N2=1000;
N=(N2-N1)+1;
n=linspace(N1,N2,N);
T=0.001;
for f=1:500
    P_PER(f)=T/N*(abs(sum(xn.*exp(-i*2*pi*f*T.*n))))^2;
end
f=linspace(1,500,500);