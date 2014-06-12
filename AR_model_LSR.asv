% Ve mat do pho cong suat, dung mo hinh AR, 
% phuong phap binh phuong toi thieu de quy

clear
close all
clc
load myfile.mat xx

N=1001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

p=5;

% Tao x~ va Rk
xn=zeros(k-p+1,1);
R=zeros(k-p+1,p); 
theta=zeros(p,1);
for l=1:(k-p+1)
    xn(l)=yy(l+p);
end

for m=1:(k-p+1)
    for n=1:p
        R(m,n) = -yy(m+p-n);
    end
end


for k=1:10
    K(k+1) = G(k)*phi(k)/(1+(phi(k))'*G(k)*phi(k));
    theta(k+1) = theta(k) + K(k+1)*(yy(k+1) - (phi(k))'*theta(k));
    G(k+1) = (eyes(p) - K(k+1)*(phi(k))')*G(k);
end