clear all; close all; clc;

w=100; h=120; M=w*h;
m=6; n=6; N=m*n;
B=zeros(N,M);
A=zeros(m,M);

k=1;
for i=1:m
	for j=1:n
		iname=sprintf("training-sets/%d%d.png",i,j);
		img=double(imread(iname));
		B(k,:)=reshape(img,1,M);
		A(i,:)+=B(k,:);
		k++;
	end;
	A(i,:)/=n;
end;

C=B'*B;
en=20;
[V D]=eigs(C,en,'lm');
P=A*V;

figure(1)
for i=1:5
	subplot(2,3,i), pcolor(flipud(reshape(V(:,i),h,w))), shading interp, colormap(gray);
	set(gca,'Xtick',[],'Ytick',[]);
	title(sprintf("ev=%g", D(i,i)));
end;
ld=log(diag(D));
subplot(2,3,6), plot(ld,'ko'), axis([0 en+1 min(ld)-1 max(ld)+1]), grid on;
ylabel("log(ev(n))");
title("Eigenvalues");

for i=0:1
	figure(i+2);
	for j=1:3
		k=3*i+j;
		minp=min(P(k,:));	maxp=max(P(k,:));	dd=(maxp-minp)/10;
		subplot(3,2,2*j-1), pcolor(flipud(reshape(A(k,:),h,w))), shading interp, colormap(gray);
		subplot(3,2,2*j), bar(P(k,:)), axis([0 en+1 minp-dd maxp+dd]);
		set(gca,'Xtick',[],'Ytick',[]);
	end;
end;



