clear
clc

L=1e5;              %Chieu dai tin hieu L=100000 mau

%Tao 3 tin hieu nhieu trang b1, b2, b3
b1=randn(1,L);      
b2=randn(1,L);
b3=randn(1,L);

A=[1 2 3; 5 3 1; 2 1 4; 3 2 1];

s=[b1; b2; b3];
x=A*s;

%-------------------------------------------------------%
%-----------------------  CAU 1  -----------------------%
%tinh E{s(n)s'(n)}
s0=s*s'./L; 

%tinh E{s(n)s'(n-1)}
s_1=zeros(3,L);
for k=1:(3*L-3)
    s_1(k+3)=s(k);
end
s1=s*s_1'./L;

%tinh E{s(n)s'(n-2)}
s_2=zeros(3,L);
for k=1:(3*L-6)
    s_2(k+6)=s(k);
end
s2=s*s_2'./L;

%tinh E{s(n)s'(n-3)}
s_3=zeros(3,L);
for k=1:(3*L-9)
    s_3(k+9)=s(k);
end
s3=s*s_3'./L;

%tinh E{x(n)x'(n)}
x0=x*x'./L; 

%tinh E{x(n)x'(n-1)}
x_1=zeros(4,L);
for k=1:(4*L-4)
    x_1(k+4)=x(k);
end
x1=x*x_1'./L;

%tinh E{x(n)x'(n-2)}
x_2=zeros(4,L);
for k=1:(4*L-8)
    x_2(k+8)=x(k);
end
x2=x*x_2'./L;

%tinh E{x(n)x'(n-3)}
x_3=zeros(4,L);
for k=1:(4*L-12)
    x_3(k+12)=x(k);
end
x3=x*x_3'./L;

%Kiem chung Rx(k)=A*Rs(k)*A'
kqua = A*s0*A' - x0;

%-------------------------------------------------------%
%-----------------------  CAU 2  -----------------------%
%-------------------------------------------------------%

h1 = exp(-0.5*(0:19));
h2 = exp(-0.8*(0:39));
h3 = exp(-0.2*(0:19));

w1 = conv(b1,h1);  %w1 = b1 (*) h1 (tich chap)
w2 = conv(b2,h2);
w3 = conv(b3,h3);

p1=sum(w1.^2)/L;    
p2=sum(w2.^2)/L;
p3=sum(w3.^2)/L;

a1=1./p1;
a2=1./p2;
a3=1./p3;

w1_n = sqrt(a1).*w1;
w2_n = sqrt(a2).*w2;
w3_n = sqrt(a3).*w3;

w1_f = zeros(1,L+39);
w3_f = zeros(1,L+39);

for k=1:(L+19)
    w1_f(k) = w1_n(k);
    w3_f(k) = w3_n(k);
end
ss=[w1_f; w2_n; w3_f];
xx=A*ss;

%tinh E{s(n)s'(n)}
ss0=ss*ss'./L; 

%tinh E{s(n)s'(n-1)}
ss_1=zeros(3,L+39);
for k=1:(3*(L+39)-3)
    ss_1(k+3)=ss(k);
end
ss1=ss*ss_1'./L;

%tinh E{s(n)s'(n-2)}
ss_2=zeros(3,L+39);
for k=1:(3*(L+39)-6)
    ss_2(k+6)=ss(k);
end
ss2=ss*ss_2'./L;

%tinh E{s(n)s'(n-3)}
ss_3=zeros(3,L+39);
for k=1:(3*(L+39)-9)
    ss_3(k+9)=ss(k);
end
ss3=ss*ss_3'./L;

%tinh E{x(n)x'(n)}
xx0=xx*xx'./L; 

%tinh E{x(n)x'(n-1)}
xx_1=zeros(4,L+39);
for k=1:(4*(L+39)-4)
    xx_1(k+4)=xx(k);
end
xx1=xx*xx_1'./L;

%tinh E{x(n)x'(n-2)}
xx_2=zeros(4,L+39);
for k=1:(4*(L+39)-8)
    xx_2(k+8)=xx(k);
end
xx2=xx*xx_2'./L;

%tinh E{x(n)x'(n-3)}
xx_3=zeros(4,L+39);
for k=1:(4*(L+39)-12)
    xx_3(k+12)=xx(k);
end
xx3=xx*xx_3'./L;

%Kiem chung Rx(k)=A*Rs(k)*A'
kqua = A*ss0*A' - xx0;

% c(1,1)=1./sqrt(D(1,1));
% c(2,2)=1./sqrt(D(2,2));
% c(3,3)=1./sqrt(D(3,3));
% W=c*U(:,1:3)';
% R0=W*xx0*W';
% R1=W*xx1*W';
% R1=(R1+R1')/2;
% R2=W*xx2*W';
% R2=(R2+R2')/2;
% R3=W*xx3*W';
% R3=(R3+R3')/2;
% [V,Q]=svd(R3);
% V'*W*A;