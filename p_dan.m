% Ve periodogram

clear
clc
load myfile.mat xx

N=10001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

for f=1:500
    s(f)=0;
    for k=1:N
        s(f)=s(f)+yy(k)*exp(-1i*2*pi*f*T.*(k-1));
    end
    P_PER(f)=T/N*(abs(s(f)).^2);
end


m=input('Nhap m=');
for f=(1+m):(500-m)
    P_temp=0;
    for k=(f-m):(f+m)
        P_temp = P_temp+ P_PER(k);
    end
    P_DAN(f)=1/(2*m+1)*P_temp;
end

for f=1:m
    P_DAN(f)=0;
end

for f=(500-m+1):500
    P_DAN(f)=0;
end

P_DAN_3db=20*log10(P_DAN);

figure
ff=1:500;
plot(ff,P_DAN);

figure
plot(ff,P_DAN_3db);