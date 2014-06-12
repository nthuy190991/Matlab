% Ve mat do pho cong suat, dung mo hinh AR, 
% phuong phap binh phuong toi thieu

clear
close all
clc
load myfile.mat xx

N=1001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

for p=1:100
    
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

    BIC(p) = p*log(N)/N + log(b0.^2);

end

figure
pp=1:100;
plot(pp,BIC);

min=BIC(1);
for p=1:100
    if (BIC(p)<min)
        min=BIC(p);
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