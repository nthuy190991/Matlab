% Ve mat do pho cong suat, dung mo hinh AR, 
% phuong phap binh phuong toi thieu

clear
close all
clc
load myfile4.mat xx

N=1001;
T=0.001;

tt=xx(1,:);
yy=xx(2,:);

p=3;

Y=zeros(N-2*p,1);
R=zeros(N-2*p,2*p); 
theta=zeros(2*p,1);
for k=2:(N-2*p+1)
     Y(k-1)=yy(k+2*p-1);
end



for m=2:(N-2*p+1)
    for n=1:(2*p)
        R(m-1,n) = -yy(m+2*p-n);
    end
end

if ((N-2*p)==(2*p))
    theta = R'*Y;
else
    theta = (R'*R)\R'*Y;
end


