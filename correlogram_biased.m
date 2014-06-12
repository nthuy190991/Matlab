% Ve uoc luong ham tu tuong quan va correlogram, uoc luong chech

clear
%close all
clc
load myfile.mat xx

N=1001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

for m=1:N
    s(m)=0;
    for k=1:(N-m+1)
        s(m)=s(m) + yy(k)*yy(k+m-1);
    end
    r1(m)=s(m)/N;
end

for m=1001:2001
    rr(m)=r1(m-1000);
end

for m=1:1000
    rr(m)=rr(2001-m);
end

mm=-1000:1000;
figure
plot(mm,rr);

% Ve correlogram

for f=1:500
    s(f)=0;
    for k=1:2001
        s(f)=s(f)+rr(k)*exp(-1i*2*pi*f*T*(k-1001));
    end
    P_COR(f)=T*(abs(s(f)).^2);
end


figure
ff=1:500;
plot(ff,P_COR);

P_COR_3db=20*log10(P_COR);
figure
plot(ff,P_COR_3db);