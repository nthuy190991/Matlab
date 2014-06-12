% Ve periodogram

%clear
clc
%load myfile.mat xx

N=480;
T=1/48000;

%tt=xx(1,:);
%yy=xx(2,:);
yy=xc;
for f=1:15000
    s(f)=0;
    for k=1:N
        s(f)=s(f)+yy(k)*exp(-1i*2*pi*f*T*(k-1));
    end
    P_PER(f)=(abs(s(f)).^2)/60000;
end

figure
ff=1:15000;
plot(ff,P_PER);

%P_PER_3db=20*log10(P_PER);
%figure
%plot(ff,P_PER_3db);