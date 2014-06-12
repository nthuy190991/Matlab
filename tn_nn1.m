clear
clc

a1=1;           %cong suat 0dB
a2=10^(5/10);   %cong suat 5dB
a3=10^(-5/10);  %cong suat -5dB

L=100000;

b1=sqrt(a1)*randn(1,L);
b2=sqrt(a2)*randn(1,L);
b3=sqrt(a3)*randn(1,L);

%tinh lai cong suat
p1=sum(b1.^2)/L;    
p2=sum(b2.^2)/L;
p3=sum(b3.^2)/L;

%cong suat o don vi dB
p1_dB=10*log10(p1)
p2_dB=10*log10(p2)
p3_dB=10*log10(p3)

%-------------------------------------------------------%
%-----------------------  CAU 1  -----------------------%
%ham tu tuong quan
rb1 = xcorr(b1,100); %100: lag
rb2 = xcorr(b2,100);
rb3 = xcorr(b3,100);

figure
t=-100:100;
plot(t,rb1);

%tinh mat do pho cong suat (overlap)
Sb1 = cpsd(b1,b1,[],L/2);
Sb2 = cpsd(b2,b2,[],L/2);
figure
plot(Sb1)

%tinh mat do pho cong suat (non overlap)
Sb1_n = cpsd(b1,b1,[],0);
Sb2_n = cpsd(b2,b2,[],0);
figure
plot(Sb2_n)

%ham tuong quan cheo
rb1b2 = xcorr(b1,b2,100,'biased');
rb1b3 = xcorr(b1,b3,100,'biased');

figure
t=-100:100;
plot(t,rb1b2);

figure
t=-100:100;
plot(t,rb1b3);

%-------------------------------------------------------%
%-----------------------  CAU 2  -----------------------%

h1 = exp(-0.5*(0:19));
h2 = exp(-0.8*(0:39));

w1_c = conv(b1,h1);  %dung ham conv()
w2_c = conv(b2,h2);

%ham tu tuong quan
rw1_c = xcorr(w1_c,100); %100: lag
rw2_c = xcorr(w2_c,100);

figure
plot(rw1_c);

w1_f = filter(h1,1,b1);  %dung ham filter()
w2_f = filter(h2,1,b2);

%ham tu tuong quan
rw1_f = xcorr(w1_f,100); %100: lag
rw2_f = xcorr(w2_f,100);

figure
plot(t,rw1_f);

%ham tuong quan cheo
rw1w2 = xcorr(w1_c,w2_c,100,'biased');
rw1w3 = xcorr(w1_c,w3_c,100,'biased');
rw1b1 = xcorr(w1_c,b1,100,'biased');
rw1b2 = xcorr(w1_c,b2,100,'biased');
rw1b3 = xcorr(w1_c,b3,100,'biased');

figure
t=-100:100;
plot(t,rw1w2);

figure
t=-100:100;
plot(t,rw1w3);

figure
t=-100:100;
plot(t,rw1b1);

figure
t=-100:100;
plot(t,rw1b2);

figure
t=-100:100;
plot(t,rw1b3);
