% Ve mat do pho cong suat, dung mo hinh MA, 
% va so sanh voi Correlogram

clear
close all
clc

T=0.001;

z1=0.95*exp(-j*15*pi/180);
b2=z1*conj(z1);
b1=-z1-conj(z1);
b0=1;

for f=1:500
    H(f)=b0+b1*exp(-1i*2*pi*f*T)+b2*exp(-1i*2*pi*f*T*2);
    
end

P=(abs(H)).^2;
P_3db=20*log10(P);

figure
ff=1:500;
plot(ff,P);

figure
plot(ff,P_3db);