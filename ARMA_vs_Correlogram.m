% Ve mat do pho cong suat, dung mo hinh ARMA, 
% va so sanh voi Correlogram

clear
close all
clc

T=0.001;

p=0.95*exp(-1i*30*pi/180);
z1=0.95*exp(-1i*15*pi/180);

a2=p*conj(p);
a1=-p-conj(p);
b2=z1*conj(z1);
b1=-z1-conj(z1);
b0=1;

for f=1:500
    N(f) = b0 + b1*exp(-1i*2*pi*f*T) + b2*exp(-1i*2*pi*f*T*2);
    D(f) = 1 + a1*exp(-1i*2*pi*f*T) + a2*exp(-1i*2*pi*f*T*2);
    H(f) = N(f)./D(f);
end

P=(abs(H)).^2;
P_3db=20*log10(P);

figure
ff=1:500;
plot(ff,P);

figure
plot(ff,P_3db);