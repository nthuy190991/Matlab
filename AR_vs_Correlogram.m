% Ve mat do pho cong suat, dung mo hinh AR, 
% va so sanh voi Correlogram

clear
close all
clc

T=0.001;

p=0.95*exp(-j*30*pi/180);
a2=p*conj(p);
a1=-p-conj(p);

b0=input(' Nhap b0: ');

for f=1:500
    s(f)=1+a1*exp(-1i*2*pi*f*T)+a2*exp(-1i*2*pi*f*T*2);
    H(f)=b0/s(f);
end

P=(abs(H)).^2;
P_3db=20*log10(P);

figure
ff=1:500;
plot(ff,P);

figure
plot(ff,P_3db);