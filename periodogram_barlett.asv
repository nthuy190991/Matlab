% Ve bien the periodogram bang phuong phap Barlett

% Chia tin hieu lam M = 4 doan

clear
clc
load myfile.mat xx

N=1001;

T=0.001;

tt=xx(1,:);
yy=xx(2,:);

yy1=yy(1:250);
yy2=yy(251:500);
yy3=yy(501:750);
yy4=yy(751:1000);

% Tinh P_PER1
for f=1:500
    s(f)=0;
    for k=1:250
        s(f)=s(f)+yy1(k)*exp(-1i*2*pi*f*T.*(k-1));
    end
    P1(f)=T/250*(abs(s(f)).^2);
end

% Tinh P_PER2
for f=1:500
    s(f)=0;
    for k=1:250
        s(f)=s(f)+yy2(k)*exp(-1i*2*pi*f*T.*(k-1));
    end
    P2(f)=T/250*(abs(s(f)).^2);
end


% Tinh P_PER3
for f=1:500
    s(f)=0;
    for k=1:250
        s(f)=s(f)+yy3(k)*exp(-1i*2*pi*f*T.*(k-1));
    end
    P3(f)=T/250*(abs(s(f)).^2);
end

% Tinh P_PER4
for f=1:500
    s(f)=0;
    for k=1:250
        s(f)=s(f)+yy4(k)*exp(-1i*2*pi*f*T.*(k-1));
    end
    P4(f)=T/250*(abs(s(f)).^2);
end

P_BAR = (P1+P2+P3+P4)/4;
P_BAR_3db=20*log10(P_BAR);

figure
ff=1:500;
plot(ff,P_BAR);

figure
plot(ff,P_BAR_3db);