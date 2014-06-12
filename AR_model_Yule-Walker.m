% Ve mat do pho cong suat, dung mo hinh AR, 
% phuong trinh Yule - Walker
% uoc luong ham tu tuong quan khong lech (unbiased estimation)

clear
close all
clc
load myfile.mat xx

N=1001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

% Uoc luong ham tu tuong quan
for m=1:N
    s(m)=0;
    for k=1:(N-m+1)
        s(m)=s(m) + yy(k)*yy(k+m-1);
    end
    r(m)=s(m)/(N-m+1);
end

for m=1001:2001
    rr(m)=r(m-1000);
end

for m=1:1000
    rr(m)=rr(2001-m);
end

mm=-1000:1000;
figure
plot(mm,rr);

% Tim p
for p=1:100
    
    rn=zeros(p,1);
    R=zeros(p,p); 
    theta=zeros(p,1);
    for k=1:p
        rn(k)=rr(k+1001);
    end

    for m=1:p
        for n=1:p
            R(m,n) = -rr(m-n+1001);
        end
    end

    theta = R\rn;

    Jmin=(rn-R*theta)'*(rn-R*theta);

    b0 = theta*rn;

    AIC(p) = 2*p/N + log(b0.^2);
   
end

pp=1:100;
plot(pp,AIC);

min=AIC(1);
for p=1:100
    if (AIC(p)<min)
        min=AIC(p);
        p0=p;
    end
end

fprintf(' Gia tri p de AIC nho nhat la: %d',p0);


% Sau khi da xac dinh duoc p, ta ve pho mat do cong suat
p=p0;
xn=zeros(N-p,1);
R=zeros(N-p,p); 
theta=zeros(p,1);
for k=1:(N-p)
     xn(k)=yy(k+p);
end



for m=1:(N-p)
    for n=1:p
        R(m,n) = -yy(m+p-n);
    end
end

theta = (R'*R)\R'*xn;

Jmin=(xn-R*theta)'*(xn-R*theta);

b0 = sqrt(Jmin/(N-p));

for f=1:500
    s(f)=1;
    for k=1:p
        s(f)=s(f)+theta(k)*exp(-1i*2*pi*f*T.*k);
    end
    H(f)=b0/s(f);
    
end

P=(abs(H)).^2;
P_3db=20*log10(P);

figure
ff=1:500;
plot(ff,P);

figure
plot(ff,P_3db);